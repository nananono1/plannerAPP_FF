import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'timetable_select_page_widget.dart' show TimetableSelectPageWidget;
import 'package:flutter/material.dart';

class TimetableSelectPageModel
    extends FlutterFlowModel<TimetableSelectPageWidget> {
  ///  Local state fields for this page.

  bool toggleon = false;

  int? selectedNo = 1;

  WeeklyTimeTableStruct? weeklyTimeTableSemi;
  void updateWeeklyTimeTableSemiStruct(
      Function(WeeklyTimeTableStruct) updateFn) {
    updateFn(weeklyTimeTableSemi ??= WeeklyTimeTableStruct());
  }

  String settingDay = 'a';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in Text widget.
  DateTime? cuper;
  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in Text widget.
  DateTime? cuper2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  DailyOutingStruct? aaa;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  DailyOutingStruct? bbb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
