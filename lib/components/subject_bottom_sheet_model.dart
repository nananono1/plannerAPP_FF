import '/flutter_flow/flutter_flow_util.dart';
import 'subject_bottom_sheet_widget.dart' show SubjectBottomSheetWidget;
import 'package:flutter/material.dart';

class SubjectBottomSheetModel
    extends FlutterFlowModel<SubjectBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
