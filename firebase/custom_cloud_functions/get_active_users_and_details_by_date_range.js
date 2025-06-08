const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Firestore 및 Realtime Database 초기화
const db = admin.firestore();
const rtdb = admin.database();

exports.getActiveUsersAndDetailsByDateRange = functions
  .region("asia-northeast3")
  .https.onCall(async (data, context) => {
    const spot = data.spot; // 매장 이름 (예: "든촌 2관")
    const startDate = data.startDate; // 시작 날짜 (YYYY-MM-DD)
    const endDate = data.endDate; // 종료 날짜 (YYYY-MM-DD)

    // 🔹 입력값이 없으면 함수 종료
    if (!spot || !startDate || !endDate) return null;

    // 🔹 Firestore에서 `users` 컬렉션에서 특정 spot의 사용자 조회
    const usersSnapshot = await db
      .collection("users")
      .where("spot", "==", spot)
      .get();
    const userDetails = {};

    usersSnapshot.forEach((doc) => {
      userDetails[doc.id] = doc.data();
    });

    // 🔹 Realtime Database에서 `userCheck/{spot}` 데이터 가져오기
    const ref = rtdb.ref(`userCheck/${spot}`);
    const snapshot = await ref.once("value");
    const dataVal = snapshot.val();

    if (!dataVal) return { message: "No data found." };

    // 🔹 날짜 범위 필터링
    const filteredData = Object.keys(dataVal)
      .filter((date) => date >= startDate && date <= endDate)
      .reduce((obj, key) => {
        obj[key] = dataVal[key]; // 해당 날짜 데이터 저장
        return obj;
      }, {});

    return { spot, startDate, endDate, filteredData, userDetails };
  });
