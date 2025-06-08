import '/flutter_flow/flutter_flow_util.dart';
import 'set_best_color_page_widget.dart' show SetBestColorPageWidget;
import 'package:flutter/material.dart';

class SetBestColorPageModel extends FlutterFlowModel<SetBestColorPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Color? colorPicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
