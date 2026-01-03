import '/flutter_flow/flutter_flow_util.dart';
import 'sign_pad_component_widget.dart' show SignPadComponentWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignPadComponentModel extends FlutterFlowModel<SignPadComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Signature widget.
  SignatureController? signatureController;
  String uploadedSignatureUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signatureController?.dispose();
  }
}
