import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'timetable_page_widget.dart' show TimetablePageWidget;
import 'package:flutter/material.dart';

class TimetablePageModel extends FlutterFlowModel<TimetablePageWidget> {
  ///  Local state fields for this page.

  bool toggleon = false;

  int? selectedNo = 1;

  WeeklyTimeTableStruct? tableToFix;
  void updateTableToFixStruct(Function(WeeklyTimeTableStruct) updateFn) {
    updateFn(tableToFix ??= WeeklyTimeTableStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
