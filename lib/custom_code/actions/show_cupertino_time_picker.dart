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

import 'package:flutter/cupertino.dart';

Future<String> showCupertinoTimePicker(BuildContext context) async {
  Duration selectedDuration = const Duration(hours: 0, minutes: 0);
  String formattedTime = "00h 00m";

  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      return Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(dialogContext).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(dialogContext),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // 완료 버튼
              CupertinoButton(
                child: const Text("완료"),
                onPressed: () {
                  formattedTime =
                      "${selectedDuration.inHours.toString().padLeft(2, '0')}h ${selectedDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}m";
                  Navigator.of(dialogContext).pop(); // 다이얼로그 닫기
                },
              ),
              // Cupertino Timer Picker (5분 단위 설정)
              Expanded(
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm, // 시 & 분 모드
                  initialTimerDuration: selectedDuration,
                  minuteInterval: 5, // 5분 단위 간격 설정
                  onTimerDurationChanged: (Duration newDuration) {
                    selectedDuration = Duration(
                      hours: newDuration.inHours,
                      minutes:
                          (newDuration.inMinutes % 60 ~/ 5) * 5, // 5분 단위로 정렬
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  return formattedTime; // 선택된 시간 반환 ("hhH mmM" 형식)
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
