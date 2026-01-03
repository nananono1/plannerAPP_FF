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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:flutter/cupertino.dart';

Future<DateTime?> cupertinoTimePicker2(BuildContext context) async {
  // 현재 시각을 기본값으로 사용
  DateTime selectedDateTime = DateTime.now();

  // 다이얼로그 표시
  final result = await showGeneralDialog<DateTime?>(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'CupertinoTimePicker',
    pageBuilder: (BuildContext dialogContext, _, __) {
      final mediaQuery = MediaQuery.maybeOf(dialogContext);
      final safeInsets = mediaQuery?.viewInsets.bottom ?? 0.0;

      Color backgroundColor = Colors.white;
      try {
        backgroundColor =
            CupertinoColors.systemBackground.resolveFrom(dialogContext);
      } catch (_) {}

      return WillPopScope(
        onWillPop: () async => false,
        child: Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              margin: EdgeInsets.only(bottom: safeInsets),
              color: backgroundColor,
              child: Column(
                children: [
                  /// 상단 버튼 영역 (순서만 변경됨)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ❌ 취소 버튼 (먼저)
                      CupertinoButton(
                        child: const Text(
                          "취소",
                          style: TextStyle(
                            color: CupertinoColors.systemRed,
                          ),
                        ),
                        onPressed: () {
                          // 취소 → null 반환
                          Navigator.of(dialogContext).pop(null);
                        },
                      ),

                      // ✅ 완료 버튼 (나중)
                      CupertinoButton(
                        child: const Text("완료"),
                        onPressed: () {
                          // 선택된 DateTime 반환
                          Navigator.of(dialogContext).pop(selectedDateTime);
                        },
                      ),
                    ],
                  ),

                  /// 시간 선택 Picker
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: selectedDateTime,
                      use24hFormat: false,
                      minuteInterval: 5,
                      onDateTimeChanged: (DateTime newDateTime) {
                        selectedDateTime = newDateTime;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );

  // 완료 → DateTime
  // 취소 → null
  return result;
}
