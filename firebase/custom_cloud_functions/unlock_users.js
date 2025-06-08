const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Firestore 초기화
const db = admin.firestore();

exports.unlockUsers = functions.pubsub
  .schedule("0 3 * * *") // 하루 한 번 실행
  .timeZone("Asia/Seoul")
  .onRun(async (context) => {
    const now = new Date();
    const threeDaysAgo = new Date(now);
    threeDaysAgo.setDate(now.getDate() - 2); // 3일 전 날짜 계산
    const threeDaysAgoTimestamp =
      admin.firestore.Timestamp.fromDate(threeDaysAgo);

    const usersRef = db.collection("users");
    const snapshot = await usersRef.where("hasLocked", "==", true).get(); // 🔹 lockedAt과 seatNo 조건을 여기서 제외

    if (snapshot.empty) {
      console.log("🔹 3일 이상 지난 locked 사용자가 없습니다.");
      return null;
    }

    // 🔹 seatNo가 0이고 lockedAt이 3일 이상 지난 사용자 필터링
    const filteredDocs = snapshot.docs.filter((doc) => {
      const userData = doc.data();
      return (
        userData.seatNo === 0 && userData.lockedAt?.toDate() <= threeDaysAgo
      );
    });

    if (filteredDocs.length === 0) {
      console.log("🔹 seatNo가 0이면서 3일 이상 지난 사용자가 없습니다.");
      return null;
    }

    const batch = db.batch();
    filteredDocs.forEach((doc) => {
      batch.update(doc.ref, { hasLocked: false });
    });

    await batch.commit();
    console.log(
      `✅ ${filteredDocs.length}명의 hasLocked 상태가 false로 변경됨`,
    );
  });
