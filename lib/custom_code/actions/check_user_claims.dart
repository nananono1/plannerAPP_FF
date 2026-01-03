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

import 'package:firebase_auth/firebase_auth.dart';

Future<String> checkUserClaims() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // ID 토큰을 가져와서 Custom Claims 확인
    final idTokenResult = await user.getIdTokenResult(true);

    // Custom Claims 확인 후 메시지 반환
    if (idTokenResult.claims != null) {
      // 권한에 따라 메시지 반환
      if (idTokenResult.claims!['master'] == true) {
        return 'master';
      } else if (idTokenResult.claims!['admin'] == true) {
        return 'admin';
      } else if (idTokenResult.claims!['manager'] == true) {
        return 'manager';
      } else {
        return 'Admin, Master, Manager 권한이 없습니다.';
      }
    } else {
      return 'Custom Claims가 없습니다.';
    }
  } else {
    return '로그인된 사용자가 없습니다.';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
