import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'timetablestart_user_set_widget.dart' show TimetablestartUserSetWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TimetablestartUserSetModel
    extends FlutterFlowModel<TimetablestartUserSetWidget> {
  ///  Local state fields for this component.

  WeeklyTimeTableStruct? toUdateLocalState;
  void updateToUdateLocalStateStruct(Function(WeeklyTimeTableStruct) updateFn) {
    updateFn(toUdateLocalState ??= WeeklyTimeTableStruct());
  }

  DateTime? pickedStarttime;

  DateTime? pickedEndTime;

  Color? pickedColor;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  Color? zzz;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in RichText widget.
  DateTime? cuoer1;
  // State field(s) for starthour widget.
  FocusNode? starthourFocusNode;
  TextEditingController? starthourTextController;
  late MaskTextInputFormatter starthourMask;
  String? Function(BuildContext, String?)? starthourTextControllerValidator;
  // State field(s) for startminute widget.
  FocusNode? startminuteFocusNode;
  TextEditingController? startminuteTextController;
  late MaskTextInputFormatter startminuteMask;
  String? Function(BuildContext, String?)? startminuteTextControllerValidator;
  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in RichText widget.
  DateTime? cuer2;
  // State field(s) for endhour widget.
  FocusNode? endhourFocusNode;
  TextEditingController? endhourTextController;
  late MaskTextInputFormatter endhourMask;
  String? Function(BuildContext, String?)? endhourTextControllerValidator;
  // State field(s) for endminute widget.
  FocusNode? endminuteFocusNode;
  TextEditingController? endminuteTextController;
  late MaskTextInputFormatter endminuteMask;
  String? Function(BuildContext, String?)? endminuteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    starthourFocusNode?.dispose();
    starthourTextController?.dispose();

    startminuteFocusNode?.dispose();
    startminuteTextController?.dispose();

    endhourFocusNode?.dispose();
    endhourTextController?.dispose();

    endminuteFocusNode?.dispose();
    endminuteTextController?.dispose();
  }
}
