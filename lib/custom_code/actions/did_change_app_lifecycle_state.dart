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

import '/backend/backend.dart'; // 자동 import (수정 금지)
import '/backend/schema/structs/index.dart'; // 자동 import (수정 금지)
import '/backend/schema/enums/enums.dart'; // 자동 import (수정 금지)
import '/backend/supabase/supabase.dart'; // 자동 import (수정 금지)
import '/actions/actions.dart' as action_blocks; // 자동 import (수정 금지)
import '/flutter_flow/flutter_flow_theme.dart'; // 자동 import (수정 금지)
import '/flutter_flow/flutter_flow_util.dart'; // 자동 import (수정 금지)
import '/custom_code/actions/index.dart'; // 다른 커스텀 액션 import (수정 금지)
import '/flutter_flow/custom_functions.dart'; // 커스텀 함수 import (수정 금지)
import 'package:flutter/material.dart'; // Flutter 기본 import (수정 금지)

import 'package:wakelock_plus/wakelock_plus.dart'; // ✅ wakelock_plus import (추가)

Future didChangeAppLifecycleState(bool? tf) async {
  // ✅ null 안전 처리: tf가 null이면 false로 간주(=화면 꺼짐 허용)
  final bool shouldKeepScreenOn = tf ?? false; // 켜짐/꺼짐 결정값

  if (shouldKeepScreenOn) {
    // ✅ 화면 자동 꺼짐 방지 ON
    await WakelockPlus.enable(); // 화면 유지
  } else {
    // ✅ 화면 자동 꺼짐 방지 OFF (기본 동작으로 복귀)
    await WakelockPlus.disable(); // 화면 꺼짐 허용
  }
}
