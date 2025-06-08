import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'timetablestart_naegongtime_widget.dart'
    show TimetablestartNaegongtimeWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TimetablestartNaegongtimeModel
    extends FlutterFlowModel<TimetablestartNaegongtimeWidget> {
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
  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in RichText widget.
  DateTime? cuoer1;
  // State field(s) for starthour widget.
  FocusNode? starthourFocusNode;
  TextEditingController? starthourTextController;
  final starthourMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? starthourTextControllerValidator;
  // State field(s) for startminute widget.
  FocusNode? startminuteFocusNode;
  TextEditingController? startminuteTextController;
  final startminuteMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? startminuteTextControllerValidator;
  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in RichText widget.
  DateTime? cuer2;
  // State field(s) for endhour widget.
  FocusNode? endhourFocusNode;
  TextEditingController? endhourTextController;
  final endhourMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? endhourTextControllerValidator;
  // State field(s) for endminute widget.
  FocusNode? endminuteFocusNode;
  TextEditingController? endminuteTextController;
  final endminuteMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? endminuteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
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
