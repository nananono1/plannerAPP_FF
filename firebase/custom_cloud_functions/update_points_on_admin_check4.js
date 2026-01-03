const functions = require("firebase-functions");
const admin = require("firebase-admin");
const https = require("https");

if (admin.apps.length === 0) {
  admin.initializeApp();
}

exports.updatePointsOnAdminCheck4 = functions
  .region("asia-northeast3")
  .firestore.document("users/{userId}/plannerVariableList/{plannerId}")
  .onUpdate(async (change, context) => {
    const beforeData = change.before.data();
    const afterData = change.after.data();
    const userId = context.params.userId;

    // ==================================================================================
    // ✅ 기능 1: 포인트 적립 및 FCM (기존 유지)
    // ==================================================================================
    if (beforeData.adminChecked === false && afterData.adminChecked === true) {
      // (기존 코드와 동일하여 생략, 위쪽 코드 그대로 사용하시면 됩니다)
      const roundedPoints = afterData.pointGiven || 0;
      const teachersQuote = afterData.teachersQuote;
      const submittedDate = afterData.submittedDate;

      await admin
        .firestore()
        .collection("users")
        .doc(userId)
        .update({
          pointListEach: admin.firestore.FieldValue.arrayUnion({
            pointGet: roundedPoints,
            getDate: admin.firestore.Timestamp.now(),
            reasonWhy: "공부기록",
          }),
          ...(teachersQuote !== undefined && {
            latestTeachersQuote: teachersQuote,
          }),
          ...(submittedDate !== undefined && {
            latestSubmittedDate: submittedDate,
          }),
          totalPoint: admin.firestore.FieldValue.increment(roundedPoints),
        });
      // ... FCM 발송 로직 등 ...
    }

    // ==================================================================================
    // ✅ 기능 2: 스케줄 기반 초개인화 GPT 코멘트 (Upgrade)
    // ==================================================================================
    if (
      beforeData.plannerSubmitted !== true &&
      afterData.plannerSubmitted === true
    ) {
      // 1. 유저의 스케줄 정보 가져오기 (비동기 호출)
      const userDocRef = admin.firestore().collection("users").doc(userId);
      const userSnapshot = await userDocRef.get();
      const userData = userSnapshot.data() || {};
      const scheduleNow = userData.scheduleNow || {}; // 유저의 요일별 스케줄

      // 2. 기본 유틸 및 설정
      const KLOCALE = "ko-KR";
      const toDate = (ts) =>
        ts && typeof ts._seconds === "number"
          ? new Date(ts._seconds * 1000)
          : null;
      const fmtHM = (d) =>
        d
          ? d.toLocaleTimeString(KLOCALE, {
              hour: "2-digit",
              minute: "2-digit",
              hour12: false,
            })
          : "";
      const getMinsOfDay = (d) => (d ? d.getHours() * 60 + d.getMinutes() : 0); // 00:00부터 몇 분 지났는지

      const submitDateObj = afterData.submittedDate
        ? toDate(afterData.submittedDate)
        : new Date();
      // 요일 키 매핑 (일:sun, 월:mon...)
      const dayKeys = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"];
      const todayKey = dayKeys[submitDateObj.getDay()];
      const todaySchedule = scheduleNow[todayKey] || {}; // 오늘의 예정 스케줄 (등/하원, 외출)

      // 3. 학습 데이터 파싱
      const inputList = Array.isArray(afterData.inputList)
        ? afterData.inputList
        : [];
      const userName =
        userData.display_name || afterData.basicInfo?.userName || "학생";

      let earliestStart = null; // 실제 첫 공부 시작
      let latestEnd = null; // 실제 마지막 공부 종료
      let totalStudyMin = 0;
      let subjectStats = {}; // 과목별 시간
      let specificEvent = []; // GPT에게 알려줄 특이사항

      inputList.forEach((item) => {
        const subject = item.SubjectNamePlanner;
        if (!subject) return;

        const starts = Array.isArray(item.studyStartTime)
          ? item.studyStartTime
          : [];
        const ends = Array.isArray(item.studyEndTime) ? item.studyEndTime : [];

        starts.forEach((s, idx) => {
          const sDate = toDate(s);
          const eDate = toDate(ends[idx]);
          if (!sDate || !eDate) return;

          // 전체 범위 갱신
          if (!earliestStart || sDate < earliestStart) earliestStart = sDate;
          if (!latestEnd || eDate > latestEnd) latestEnd = eDate;

          const dur = (eDate - sDate) / 60000; // 분 단위
          if (dur > 0) {
            totalStudyMin += dur;
            subjectStats[subject] = (subjectStats[subject] || 0) + dur;
          }
        });
      });

      if (!earliestStart) {
        console.log("공부 기록이 없어 종료");
        return null;
      }

      // 4. [NEW] 스케줄 vs 실제 비교 로직 (Schedule Context)
      const schedStart = toDate(todaySchedule.naegongStartTime); // 예정 등원
      const schedEnd = toDate(todaySchedule.naegongEndTime); // 예정 하원
      const outings = Array.isArray(todaySchedule.dailyoutingList)
        ? todaySchedule.dailyoutingList
        : [];

      let scheduleContext = [];

      // A. 등원 시간 체크
      if (schedStart) {
        const diffStart =
          getMinsOfDay(earliestStart) - getMinsOfDay(schedStart); // 음수면 일찍 옴
        if (diffStart <= -10) {
          scheduleContext.push(
            `[칭찬 포인트] 예정된 등원 시간(${fmtHM(schedStart)})보다 ${Math.abs(diffStart)}분이나 일찍 시작했습니다. 엄청난 성실함입니다.`,
          );
        } else if (diffStart >= 30) {
          scheduleContext.push(
            `[격려 포인트] 예정 등원(${fmtHM(schedStart)})보다 ${diffStart}분 늦게 시작했습니다. 피곤했겠지만 책상에 앉은 것만으로 다행입니다.`,
          );
        } else {
          scheduleContext.push(
            `[사실] 약속된 등원 시간(${fmtHM(schedStart)})을 잘 지켜 시작했습니다.`,
          );
        }
      }

      // B. 하원/야근 체크
      if (schedEnd) {
        const diffEnd = getMinsOfDay(latestEnd) - getMinsOfDay(schedEnd);
        if (diffEnd >= 30) {
          scheduleContext.push(
            `[칭찬 포인트] 예정 하원 시간(${fmtHM(schedEnd)})을 넘겨 ${fmtHM(latestEnd)}까지 공부했습니다. 불타는 열정입니다.`,
          );
        }
      }

      // C. 학원/외출 일정 반영
      if (outings.length > 0) {
        const outingNames = outings.map((o) => o.reason).join(", ");
        scheduleContext.push(
          `[상황] 오늘은 '${outingNames}' 일정이 있는 바쁜 날이었습니다. 학원/외출 스케줄 사이사이에 공부하느라 고생했습니다.`,
        );
      }

      // 5. GPT 프롬프트 구성 (페르소나 + 스케줄 컨텍스트 결합)
      const dayNameKor = ["일", "월", "화", "수", "목", "금", "토"][
        submitDateObj.getDay()
      ];
      const topSubject = Object.keys(subjectStats).reduce(
        (a, b) => (subjectStats[a] > subjectStats[b] ? a : b),
        "",
      );

      // 랜덤 페르소나 (기존 로직 활용)
      const STYLE_PACKS = [
        {
          name: "Warm-Coach",
          note: '따뜻하고 세심하게 관찰하는 선생님 말투. "학원 다녀오느라 힘들었죠?" 같은 공감 위주.',
        },
        {
          name: "Data-Analyst",
          note: '분석적이고 차분한 말투. "등원 시간을 15분 단축했군요." 처럼 팩트 위주 칭찬.',
        },
        {
          name: "Cheerleader",
          note: '에너지 넘치는 말투. 느낌표 사용! "와! 오늘 일정 빡빡한데 이걸 해내다니!"',
        },
        {
          name: "Tsundere",
          note: '무심한 듯 챙겨주는 말투. "학원 때문에 바빴을 텐데, 공부는 꼬박꼬박 했네. 잘했어."',
        },
      ];
      const selectedStyle =
        STYLE_PACKS[Math.floor(Math.random() * STYLE_PACKS.length)];

      const prompt = [
        `학생 이름: ${userName}`,
        `오늘 요일: ${dayNameKor}요일`,
        `총 공부 시간: ${(totalStudyMin / 60).toFixed(1)}시간`,
        `주력 과목: ${topSubject}`,
        `[스케줄 분석 및 특이사항]:`,
        ...scheduleContext,
        `---`,
        `[지시사항]`,
        `1. 당신은 학생의 플래너를 검사하는 선생님입니다. 페르소나: '${selectedStyle.name}' (${selectedStyle.note})`,
        `2. 위 [스케줄 분석] 내용을 자연스럽게 언급해주세요. (예: "오늘 수학학원도 있었는데 빈 시간에 영단어 외운거 아주 칭찬해", "약속된 시간보다 20분이나 일찍 왔네? 기특하다")`,
        `3. 기계적인 "수고했습니다" 보다는, 학생의 구체적인 상황(등원시간 준수, 학원 일정 등)을 알아봐 주는 '사람 같은' 코멘트를 1~2문장으로 작성하세요.`,
        `4. 이모지는 최대 1개만 사용.`,
        `5. JSON 포맷으로 출력: {"quote": "여기에 코멘트 작성"}`,
      ].join("\n");

      // 6. OpenAI API 호출
      const apiKey = functions.config().openai?.key;
      if (!apiKey) return null;

      try {
        const reqPayload = {
          model: "gpt-4o", // gpt-4o or gpt-3.5-turbo
          messages: [
            {
              role: "system",
              content: "You are a helpful and observant study coach.",
            },
            { role: "user", content: prompt },
          ],
          response_format: { type: "json_object" },
          temperature: 0.8,
        };

        // (https.request 로직은 기존과 동일하므로 간략화하여 표현)
        const responseJSON = await callOpenAI(reqPayload, apiKey);
        const finalQuote = responseJSON?.quote || "";

        // 7. 결과 저장
        if (finalQuote) {
          await change.after.ref.update({
            teachersQuote: finalQuote,
            teachersQuoteMeta: {
              style: selectedStyle.name,
              analyzedSchedule: scheduleContext.join(" / "), // 분석 내용 백업
              updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            },
          });
          console.log(`[Generated Quote] ${finalQuote}`);
        }
      } catch (e) {
        console.error("OpenAI Error", e);
      }
    }
  });

// OpenAI 호출 헬퍼 함수 (Promise 래핑)
function callOpenAI(payload, key) {
  return new Promise((resolve, reject) => {
    const body = JSON.stringify(payload);
    const opts = {
      hostname: "api.openai.com",
      path: "/v1/chat/completions",
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${key}`,
        "Content-Length": Buffer.byteLength(body),
      },
    };
    const req = https.request(opts, (res) => {
      let data = "";
      res.on("data", (c) => (data += c));
      res.on("end", () => {
        try {
          const parsed = JSON.parse(data);
          const content = parsed.choices[0].message.content;
          resolve(JSON.parse(content));
        } catch (e) {
          reject(e);
        }
      });
    });
    req.on("error", reject);
    req.write(body);
    req.end();
  });
}
