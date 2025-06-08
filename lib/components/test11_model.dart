import '/flutter_flow/flutter_flow_util.dart';
import 'test11_widget.dart' show Test11Widget;
import 'package:flutter/material.dart';

class Test11Model extends FlutterFlowModel<Test11Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField34 widget.
  FocusNode? textField34FocusNode;
  TextEditingController? textField34TextController;
  String? Function(BuildContext, String?)? textField34TextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField34FocusNode?.dispose();
    textField34TextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }
}
