// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future onAppBackground() async {
  // 앱 라이프사이클 옵저버 추가 (앱 종료 감지)
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
}

class AppLifecycleObserver with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 앱이 종료될 때만 해당 로직을 실행
    if (state == AppLifecycleState.detached) {
      handleAppTermination(); // 앱 종료 시 처리할 로직
    }
  }

  // 앱 종료 시 실행할 로직
  void handleAppTermination() {
    // indexIDParameter를 전역 상태에서 가져옴
    final int? indexIDParameter = FFAppState().currentIndexIDParameter;

    // 타이머가 실행 중이고 indexIDParameter가 유효한 경우에만 종료 시간 기록
    if (FFAppState().timeIsGoing == true && indexIDParameter != null) {
      // 타이머 중지 및 종료 시간 기록
      FFAppState().timeIsGoing = false;

      // inputListState에 종료 시간 기록
      FFAppState().updatePageStateSchemaVariableStruct(
        (e) => e
          ..updateInputListState(
            (e) => e[indexIDParameter].updateStudyEndTime(
              (e) => e.add(getCurrentTimestamp), // 현재 시간으로 종료 시간 기록
            ),
          ),
      );
      print('타이머 중지 및 종료 시간 기록 완료');
    } else {
      print('타이머가 실행 중이지 않거나 indexIDParameter가 null입니다.');
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
