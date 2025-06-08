const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Firestore 및 Realtime Database 초기화
const db = admin.firestore();
const rtdb = admin.database();

exports.calculateRankings2 = functions
  .region("asia-northeast3")
  .runWith({ memory: "512MB" })
  .pubsub.schedule("every day 04:30")
  .timeZone("Asia/Seoul")
  .onRun(async (context) => {
    // ✅ Firestore에서 seatNo > 0인 유저 조회
    const usersSnapshot = await db
      .collection("users")
      .where("seatNo", ">", 0)
      .where("seatNo", "<", 300)
      .get();
    if (usersSnapshot.empty) {
      console.log("No users found with seatNo > 0");
      return null;
    }

    const now = new Date();

    // KST 기준 주간 시작일 (지난 월요일, 자정 기준)
    const startOfWeekKST = new Date(now.setHours(0, 0, 0, 0));
    startOfWeekKST.setDate(
      startOfWeekKST.getDate() - startOfWeekKST.getDay() + 1,
    ); // 월요일

    // KST 기준 월간 시작일 (1일, 자정 기준)
    const startOfMonthKST = new Date(now.getFullYear(), now.getMonth(), 1);

    const weeklyRankings = [];
    const monthlyRankings = [];
    let activeUserData = {}; // ✅ 매장별 활성 유저 데이터를 저장할 객체
    const batch = db.batch(); // 🔹 Firestore batch for bulk updates

    // 🔹 3일 이상 지난 locked 사용자 해제 기준 설정
    const threeDaysAgo = new Date(now);
    threeDaysAgo.setDate(now.getDate() + 1);
    const threeDaysAgoTimestamp =
      admin.firestore.Timestamp.fromDate(threeDaysAgo);

    usersSnapshot.forEach((doc) => {
      const userData = doc.data();
      const pointList = Array.isArray(userData.pointListEach)
        ? userData.pointListEach
        : [];
      const spot = userData.spot || "Unknown";
      const seatNo = userData.seatNo || 0;

      // ✅ 매장별 활성 유저 수 기록 (Realtime Database 저장용)
      if (!activeUserData[spot]) {
        activeUserData[spot] = {
          totalActiveUsers: 0,
          activeSeats: [],
        };
      }
      activeUserData[spot].totalActiveUsers += 1;
      activeUserData[spot].activeSeats.push(seatNo);

      // ✅ 주간 포인트 계산
      const weeklyPoints = pointList
        .filter((point) => point?.getDate?.toDate() >= startOfWeekKST)
        .reduce((acc, point) => acc + point.pointGet, 0);

      // ✅ 월간 포인트 계산
      const monthlyPoints = pointList
        .filter((point) => point?.getDate?.toDate() >= startOfMonthKST)
        .reduce((acc, point) => acc + point.pointGet, 0);

      // ✅ 주간 랭킹 데이터 추가
      weeklyRankings.push({
        RankUserName: userData.display_name || "Unknown",
        pointInDuration: weeklyPoints || 0,
        schoolNameRank: userData.school || " ",
        seatNoRank: userData.seatNo || 0,
        spotUserRank: userData.spot || " ",
      });

      // ✅ 월간 랭킹 데이터 추가
      monthlyRankings.push({
        RankUserName: userData.display_name || "Unknown",
        pointInDuration: monthlyPoints || 0,
        schoolNameRank: userData.school || " ",
        seatNoRank: userData.seatNo || 0,
        spotUserRank: userData.spot || " ",
      });

      // 🔹 hasLocked 해제 (3일 이상 잠긴 사용자)
      if (userData.hasLocked && userData.lockedAt?.toDate() <= threeDaysAgo) {
        batch.update(doc.ref, { hasLocked: false });
      }
    });

    // ✅ 주간 및 월간 랭킹 정렬 (포인트 기준 내림차순)
    weeklyRankings.sort((a, b) => b.pointInDuration - a.pointInDuration);
    monthlyRankings.sort((a, b) => b.pointInDuration - a.pointInDuration);

    // ✅ 현재 날짜 (KST)
    const dateMadeKST = new Date();

    // ✅ Firestore에 주간 랭킹 업데이트
    await db
      .collection("weeklyRank")
      .doc("e3PvWGjRF1fF4gFTnU8N")
      .set({
        dateMade: admin.firestore.Timestamp.fromDate(dateMadeKST),
        toggleOnOff: true,
        weeklyRankInfo: weeklyRankings,
      });

    // ✅ Firestore에 월간 랭킹 업데이트
    await db
      .collection("monthlyRank")
      .doc("w2yDNRrmECdjPI5TstDZ")
      .set({
        dateMade: admin.firestore.Timestamp.fromDate(dateMadeKST),
        toggleOnOff: true,
        monthlyRankInfo: monthlyRankings,
      });

    console.log("Weekly and Monthly rankings updated successfully.");

    // ✅ todayStr을 위한 별도 날짜 객체 생성 (하루 뒤 날짜)
    const tomorrowKST = new Date(dateMadeKST);
    tomorrowKST.setDate(tomorrowKST.getDate() + 0);
    // ✅ Realtime Database에 매장별 활성 유저 데이터 저장
    const todayStr = tomorrowKST.toISOString().split("T")[0];

    const updates = {};

    Object.entries(activeUserData).forEach(([spot, data]) => {
      // 🔹 date 필드 추가하여 저장
      updates[`${spot}/${todayStr}`] = {
        ...data, // 기존 데이터 유지
        date: todayStr, // 날짜 필드 추가
      };
    });

    await rtdb.ref("/userCheck").update(updates);
    console.log(
      `Daily active users recorded in RTDB for ${todayStr}:`,
      activeUserData,
    );

    // 🔹 Firestore 배치 커밋 (hasLocked 해제)
    await batch.commit();
    console.log("✅ Locked users updated successfully.");

    return null;
  });
