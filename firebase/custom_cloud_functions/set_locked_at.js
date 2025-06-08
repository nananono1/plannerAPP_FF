const functions = require("firebase-functions");
const admin = require("firebase-admin");
const db = admin.firestore();

/**
 * 1️⃣ Firestore 트리거: hasLocked가 true로 변경되면 lockedAt을 저장
 */
exports.setLockedAt = functions.firestore
  .document("users/{userId}")
  .onUpdate(async (change, context) => {
    const beforeData = change.before.data();
    const afterData = change.after.data();

    // hasLocked가 false -> true로 변경될 때만 실행
    if (!beforeData.hasLocked && afterData.hasLocked) {
      await change.after.ref.update({
        lockedAt: admin.firestore.Timestamp.now(),
      });
      console.log(`✅ 사용자 ${context.params.userId}의 lockedAt이 설정됨`);
    }
  });
