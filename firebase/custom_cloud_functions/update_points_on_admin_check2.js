const functions = require("firebase-functions");

const admin = require("firebase-admin");

const https = require("https");

exports.updatePointsOnAdminCheck2 = functions.firestore

  .document("users/{userId}/plannerVariableList/{plannerId}")

  .onUpdate(async (change, context) => {
    const beforeData = change.before.data();

    const afterData = change.after.data();

    const userId = context.params.userId;

    // ✅ 기능 1: adminChecked → true일 때 포인트 계산

    if (beforeData.adminChecked === false && afterData.adminChecked === true) {
      const inputList = afterData.inputList || [];

      let totalPoints = 0;

      inputList.forEach((item) => {
        const startList = item.studyStartTime || [];

        const endList = item.studyEndTime || [];

        startList.forEach((start, idx) => {
          const end = endList[idx];

          if (!start || !end) return;

          const startDate = new Date(start._seconds * 1000);

          const endDate = new Date(end._seconds * 1000);

          if (isNaN(startDate) || isNaN(endDate)) return;

          totalPoints += calculatePointsForSession(startDate, endDate);
        });
      });

      const roundedPoints = isNaN(totalPoints) ? 0 : Math.round(totalPoints);

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

      const userDoc = await admin
        .firestore()
        .collection("users")
        .doc(userId)
        .get();
      const fcmToken = userDoc.data()?.fcmToken;
      if (fcmToken) {
        await admin.messaging().send({
          notification: {
            title: "플래너 확인 완료",
            body: `제출하신 플래너가 확인되었습니다. ${roundedPoints} 포인트 획득하셨습니다.`,
          },
          token: fcmToken,
          data: {
            fcmType: "planner",
            latestTeachersQuote: teachersQuote || "",
            latestSubmittedDate: submittedDate
              ? submittedDate.toDate().toISOString()
              : "",
          },
        });
      }
    }

    // ✅ 기능 2: plannerSubmitted → true → GPT 응원 메시지 생성
    if (
      beforeData.plannerSubmitted !== true &&
      afterData.plannerSubmitted === true
    ) {
      const inputList = afterData.inputList || [];
      const subjectSummary = {};
      const userName = afterData.basicInfo.userName || "학생";
      inputList.forEach((item) => {
        const subject = item.SubjectNamePlanner;
        const details = item.WhatIDid;
        const starts = item.studyStartTime;
        const ends = item.studyEndTime;

        if (
          !subject ||
          !details ||
          !Array.isArray(starts) ||
          !Array.isArray(ends)
        )
          return;

        starts.forEach((start, idx) => {
          const end = ends[idx];
          if (!start || !end) return;

          const startDate = new Date(
            start._seconds * 1000 + 9 * 60 * 60 * 1000,
          );
          const endDate = new Date(end._seconds * 1000 + 9 * 60 * 60 * 1000);
          if (isNaN(startDate) || isNaN(endDate)) return;

          const durationMin = (endDate - startDate) / (1000 * 60);
          const durationHr = (durationMin / 60).toFixed(1);
          const timeRange = `${startDate.toLocaleTimeString("ko-KR", { hour: "2-digit", minute: "2-digit" })} ~ ${endDate.toLocaleTimeString("ko-KR", { hour: "2-digit", minute: "2-digit" })}`;
          const line = `${timeRange} (${durationHr}시간), ${details}`;

          if (!subjectSummary[subject]) subjectSummary[subject] = [];
          subjectSummary[subject].push(line);
        });
      });

      const lines = ["오늘 학생은 아래와 같이 공부했습니다:\n"];
      Object.entries(subjectSummary).forEach(([subject, sessions]) => {
        sessions.forEach((session) => lines.push(`- ${subject}: ${session}`));
      });

      if (lines.length === 1) return null;

      lines.push("\n이 내용을 바탕으로 학생에게 학습피드백을 작성하세요.");
      lines.push(
        "형식적이지 않게, 학생의 노력이 느껴지는 진솔한 문장으로 부탁 드립니다.",
      );
      lines.push(
        "총 길이는 공백 포함 120자, 공백 제외 95자 내외로 되면 좋을거같아요. 공백제외 80자 이상은 필수입니다.",
      );
      lines.push(
        "당신은 학습 가이드로서, 학생들의 학습정보를 파악한 티를 내야합니다.",
      );
      lines.unshift(`${userName}님, 아래와 같이 공부했습니다:\n`);
      lines.push(
        "학생의 이름을 포함해 주세요. 문장은 너무 길지 않게, 일일 피드백에 맞게 간결하고 진솔하게 작성해 주세요. 반말이 아닌 존댓말로 작성해 주세요.",
      );
      lines.push(
        "예시1. 나연님, 국어와 영어 모두 명확한 목표 설정과 함께 깔끔하게 실천한 점이 좋았습니다 ^_^   특히 영어 듣기와 숙제를 함께 챙긴 점에서 꼼꼼함이 느껴져요 :)",
      );
      lines.push(
        "예시2. 기현님, 수학과 국어 모두 긴 시간 집중하며 계획을 깔끔하게 실천한 점이 인상 깊어요 :)   특히 국어 숙제를 3시간 가까이 몰입해 끝낸 부분이 대단하네요!",
      );
      lines.push(
        "예시3. 시연님, 과목별로 계획을 다양하게 세우고 대부분 성실히 실천한 점이 인상적이에요!  수학 일부는 미완료로 남았지만 전반적으로 집중력 있는 하루였어요 ^_^",
      );
      lines.push(
        "예시4. 최윤아학생 고생하셨습니다 :) 늦은 시간까지 흐트러짐 없이 항상 열심히 공부하는 모습이 참 기특합니다! 내공이 응원할게요~ 내일도 화이팅 입니다!",
      );
      lines.push(
        "예시5. 수영학생, 오늘은 다양한 과목을 열심히 공부했네요. 이렇게 쉼없이 공부하는 모습을 보면 좋은 결과는 당연하다고 생각합니다. 앞으로 이 열정, 끈기 잃지 않고 끝까지 달려봅시다. 파이팅입니다!",
      );
      lines.push(
        "예시6. 찬민학생 한과목에 집중하는 것도 좋지만 8시간동안 한가지 과목만 공부하는 것은 체력적으로, 밸런스적으로 좋지 않을 수 있습니다. 긴 시간 공부하는 열정은 칭찬하지만 다양한 과목 공부해봅시다!",
      );
      const prompt = lines.join("\n");

      console.log("[🧠 GPT 프롬프트]", prompt);

      const apiKey = functions.config().openai.key; // 🔐 qhdks

      const requestBody = JSON.stringify({
        model: "gpt-4o",
        messages: [
          {
            role: "system",
            content:
              "당신은 학생에게 따뜻한 응원의 메시지를 보내는 멘토이자 공부 길잡이입니다. 한국어로 진심 어린 문장을 작성하세요.",
          },
          { role: "user", content: prompt },
        ],
        temperature: 0.8,
      });

      const options = {
        hostname: "api.openai.com",
        path: "/v1/chat/completions",
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${apiKey}`,
          "Content-Length": Buffer.byteLength(requestBody),
        },
      };

      const gptResponse = await new Promise((resolve, reject) => {
        const req = https.request(options, (res) => {
          let data = "";
          res.on("data", (chunk) => (data += chunk));
          res.on("end", () => {
            try {
              const parsed = JSON.parse(data);
              const result = parsed.choices?.[0]?.message?.content?.trim(); // ✅ result 정의
              console.log("[✅ GPT 응답]", result); // ✅ 여기에서 로그
              resolve(result); // ✅ 그 다음에 반환
            } catch (err) {
              console.error("응답 파싱 실패:", err);
              reject(err);
            }
          });
        });

        req.on("error", (err) => {
          console.error("HTTPS 요청 실패:", err);
          reject(err);
        });

        req.write(requestBody);
        req.end();
      });

      if (gptResponse) {
        await change.after.ref.update({
          teachersQuote: gptResponse,
        });
      }
    }

    return null;
  });

// 🔧 포인트 계산 함수들
function calculatePointsForSession(startDate, endDate) {
  let total = 0;
  let curStart = new Date(startDate);
  let curEnd = new Date(curStart);
  curEnd.setHours(23, 59, 59, 999);

  while (curStart <= endDate) {
    if (curEnd > endDate) curEnd = endDate;
    total += calculatePointsForDay(curStart, curEnd);
    curStart.setDate(curStart.getDate() + 1);
    curStart.setHours(0, 0, 0, 0);
    curEnd = new Date(curStart);
    curEnd.setHours(23, 59, 59, 999);
  }
  return total;
}

function calculatePointsForDay(startDate, endDate) {
  const getTime = (h, m) => new Date(startDate).setHours(h, m, 0, 0);
  let total = 0;

  const range = (s, e, rate) => {
    const from = Math.max(startDate.getTime(), s);
    const to = Math.min(endDate.getTime(), e);
    return from < to ? ((to - from) / 60000) * rate : 0;
  };

  total += range(getTime(0, 0), getTime(0, 30), 8.3334);
  total += range(getTime(0, 30), getTime(7, 0), 1.6667);
  total += range(getTime(7, 0), getTime(10, 0), 8.3334);
  total += range(getTime(10, 0), getTime(22, 20), 1.6667);
  total += range(getTime(22, 20), getTime(23, 59), 8.3334);

  return total;
}
