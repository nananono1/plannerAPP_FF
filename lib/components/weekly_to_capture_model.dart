import '/flutter_flow/flutter_flow_util.dart';
import 'weekly_to_capture_widget.dart' show WeeklyToCaptureWidget;
import 'package:flutter/material.dart';

class WeeklyToCaptureModel extends FlutterFlowModel<WeeklyToCaptureWidget> {
  ///  Local state fields for this component.

  DateTime? starttime;

  DateTime? endtime;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
