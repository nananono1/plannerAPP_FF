import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'admin_time_table_page_widget.dart' show AdminTimeTablePageWidget;
import 'package:flutter/material.dart';

class AdminTimeTablePageModel
    extends FlutterFlowModel<AdminTimeTablePageWidget> {
  ///  Local state fields for this page.

  WeeklyTimeTableStruct? timetablenow;
  void updateTimetablenowStruct(Function(WeeklyTimeTableStruct) updateFn) {
    updateFn(timetablenow ??= WeeklyTimeTableStruct());
  }

  WeeklyTimeTableStruct? timetableNew;
  void updateTimetableNewStruct(Function(WeeklyTimeTableStruct) updateFn) {
    updateFn(timetableNew ??= WeeklyTimeTableStruct());
  }

  UsersRecord? usernow;

  String? usernowName;

  bool manualChaneMode = false;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminTimeTablePage widget.
  String? checkusercalimaction;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? dddd;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? managersign;
  // Stores action output result for [Backend Call - API (Sheet schedule)] action in Button widget.
  ApiCallResponse? apicall;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  DailyOutingStruct? naegongtime;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  DailyOutingStruct? naegongtimeCopy;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  DailyOutingStruct? aaa;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  DailyOutingStruct? bbb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
