import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'secure_sign_page_widget.dart' show SecureSignPageWidget;
import 'package:flutter/material.dart';

class SecureSignPageModel extends FlutterFlowModel<SecureSignPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextFields1 widget.
  FocusNode? textFields1FocusNode;
  TextEditingController? textFields1TextController;
  String? Function(BuildContext, String?)? textFields1TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFields1FocusNode?.dispose();
    textFields1TextController?.dispose();
  }
}
