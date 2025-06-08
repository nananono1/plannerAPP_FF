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

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

Future<DateTime> cupertinoTimePicker2(BuildContext context) async {
  DateTime now = DateTime.now();
  DateTime selectedDateTime = now;

  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      final mediaQuery = MediaQuery.maybeOf(dialogContext);
      final safeInsets = mediaQuery?.viewInsets.bottom ?? 0.0;

      Color? backgroundColor;
      try {
        backgroundColor =
            CupertinoColors.systemBackground.resolveFrom(dialogContext);
      } catch (e) {
        backgroundColor = Colors.white; // fallback
      }

      return Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(bottom: safeInsets),
        color: backgroundColor,
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              CupertinoButton(
                child: const Text("완료"),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
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
      );
    },
  );

  return selectedDateTime;
}
