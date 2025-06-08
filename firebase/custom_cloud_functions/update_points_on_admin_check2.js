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
      beforeData.plannerSubmitted === false &&
      afterData.plannerSubmitted === true
    ) {
      const inputList = afterData.inputList || [];
      const subjectSummary = {};

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

          const startDate = new Date(start._seconds * 1000);
          const endDate = new Date(end._seconds * 1000);
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

      lines.push(
        "\n이 내용을 바탕으로 학생에게 따뜻하고 진심 어린 응원의 메시지를 한 문장으로 작성해 주세요.",
      );
      lines.push(
        "형식적이지 않게, 학생의 노력이 느껴지는 진솔한 문장으로 부탁 드립니다.",
      );
      const prompt = lines.join("\n");

      const apiKey = functions.config().openai.key; // 🔐 실제 키로 교체

      const requestBody = JSON.stringify({
        model: "gpt-4o",
        messages: [
          {
            role: "system",
            content:
              "당신은 학생에게 따뜻한 응원의 메시지를 보내는 멘토입니다. 한국어로 진심 어린 문장을 작성하세요.",
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
              resolve(parsed.choices?.[0]?.message?.content?.trim());
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
