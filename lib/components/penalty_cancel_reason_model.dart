import '/flutter_flow/flutter_flow_util.dart';
import 'penalty_cancel_reason_widget.dart' show PenaltyCancelReasonWidget;
import 'package:flutter/material.dart';

class PenaltyCancelReasonModel
    extends FlutterFlowModel<PenaltyCancelReasonWidget> {
  ///  Local state fields for this component.

  String reason2 = ' ';

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
