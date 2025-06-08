import '/flutter_flow/flutter_flow_util.dart';
import 'widget_to_capture_component_widget.dart'
    show WidgetToCaptureComponentWidget;
import 'package:flutter/material.dart';

class WidgetToCaptureComponentModel
    extends FlutterFlowModel<WidgetToCaptureComponentWidget> {
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
