const functions = require("firebase-functions"); // Firebase Functions SDK를 불러옵니다.
const admin = require("firebase-admin"); // Firebase Admin SDK를 불러옵니다.
// FlutterFlow 템플릿 상단에서 이미 admin.initializeApp()을 호출하고 있기 때문에
// 여기서는 다시 initializeApp()을 호출하지 않습니다. (중복 초기화 방지)

exports.newCloudFunction = functions // Cloud Function을 exports로 내보냅니다.
  .region("asia-northeast3") // 함수가 동작할 리전을 asia-northeast3(서울)로 지정합니다.
  .https.onCall(async (data, context) => {
    // HTTPS Callable Function으로 정의합니다. (클라이언트에서 직접 호출 가능)

    const uid = data.uid; // 클라이언트에서 전달한 uid를 꺼냅니다.
    const newPassword = data.newPassword; // 클라이언트에서 전달한 새 비밀번호를 꺼냅니다.

    // ─────────────────────────────────────────────
    // 0) 들어온 인증 정보 전체를 로그로 출력 (디버깅용)
    // ─────────────────────────────────────────────
    console.log("context.auth 전체:", context.auth); // 현재 함수 호출에 포함된 인증 정보를 통째로 출력합니다.
    if (context.auth && context.auth.token) {
      // 인증 토큰이 존재하는 경우
      console.log("context.auth.token:", context.auth.token); // 토큰 안에 어떤 claims가 있는지 출력합니다.
      console.log(
        "context.auth.token.admin:", // admin claim 값만 따로 출력합니다.
        context.auth.token.admin,
      );
    } else {
      // 인증 정보가 전혀 없는 경우
      console.log(
        "context.auth 가 없습니다. (비로그인 또는 HTTP 호출일 가능성)",
      );
    }

    // ─────────────────────────────────────────────
    // 1) 관리자 권한 확인 (Custom Claims 기반)
    // ─────────────────────────────────────────────
    if (
      !context.auth || // 로그인 정보 자체가 없거나
      !context.auth.token || // 토큰 객체가 없거나
      context.auth.token.admin !== true // 토큰 안에 admin: true 가 아닌 경우
    ) {
      // Cloud Functions for Firebase에서 권한 문제가 있을 때는
      // HttpsError를 던져 클라이언트에서 처리할 수 있게 합니다.
      throw new functions.https.HttpsError(
        "permission-denied", // 에러 코드: permission-denied
        "관리자 권한이 없습니다.", // 에러 메시지
      );
    }

    // ─────────────────────────────────────────────
    // 2) 비밀번호 유효성 검사 (선택 사항이지만 넣어두면 안전)
    // ─────────────────────────────────────────────
    if (!newPassword || newPassword.length < 6) {
      // 비밀번호가 없거나 6자 미만인 경우
      throw new functions.https.HttpsError(
        "invalid-argument", // 에러 코드: invalid-argument
        "비밀번호는 최소 6자 이상이어야 합니다.", // 에러 메시지
      );
    }

    // ─────────────────────────────────────────────
    // 3) Firebase Auth 계정의 비밀번호 강제 변경
    // ─────────────────────────────────────────────
    await admin.auth().updateUser(uid, {
      // Admin SDK를 사용해 해당 uid 사용자를 업데이트합니다.
      password: newPassword, // 새로운 비밀번호를 설정합니다.
    });

    console.log(`비밀번호 변경 완료 - uid: ${uid}`); // 서버 로그에 비밀번호 변경 완료를 남깁니다.

    // ─────────────────────────────────────────────
    // 4) 클라이언트로 성공 응답 반환
    // ─────────────────────────────────────────────
    return { success: true }; // 호출한 쪽에서 success == true 로 체크할 수 있도록 합니다.
  });
