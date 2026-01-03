// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart'; // Firebase Cloud Functions 클라이언트 SDK를 가져옵니다.

Future<bool> adminResetPasswordAction(
  // FlutterFlow에서 사용할 커스텀 액션 함수입니다.
  String uid, // 비밀번호를 변경할 대상 학생의 Firebase Auth UID입니다.
  String newPassword, // 새 비밀번호 문자열입니다.
) async {
  final FirebaseFunctions functions = FirebaseFunctions.instanceFor(
    // 특정 리전에 대한 Cloud Functions 인스턴스를 가져옵니다.
    region: 'asia-northeast3', // 함수가 배포된 리전을 서울(asia-northeast3)로 지정합니다.
  );

  final HttpsCallable callable = functions
      .httpsCallable('newCloudFunction'); // 호출할 HTTPS Callable 함수 이름을 지정합니다.

  try {
    // 네트워크/함수 호출 중 발생할 수 있는 예외를 처리하기 위해 try 블록을 사용합니다.
    final HttpsCallableResult result = await callable.call(<String, dynamic>{
      // Cloud Function을 호출하면서 파라미터를 전달합니다.
      'uid': uid, // 대상 사용자 UID를 서버로 전달합니다.
      'newPassword': newPassword, // 새 비밀번호를 서버로 전달합니다.
    });

    final dynamic data = result.data; // Cloud Function이 반환한 data 부분만 가져옵니다.
    // 이 시점에서 data 는 일반적으로 {success: true} 형태의 Map 입니다.

    if (data is Map && data['success'] == true) {
      // data가 Map 이고, success 키가 true이면
      return true; // 비밀번호 변경 성공으로 판단하고 true를 반환합니다.
    }

    return false; // 위 조건을 만족하지 않으면 실패로 판단하고 false를 반환합니다.
  } on FirebaseFunctionsException {
    // Cloud Functions 쪽에서 HttpsError 를 던진 경우입니다.
    return false; // 에러 상황에서는 false를 반환합니다.
  } catch (_) {
    // 그 외 알 수 없는 예외가 발생한 경우입니다.
    return false; // 모든 예외 상황에서 false를 반환합니다.
  }
}
