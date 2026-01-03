import '/flutter_flow/flutter_flow_util.dart';
import 'pwreset_widget.dart' show PwresetWidget;
import 'package:flutter/material.dart';

class PwresetModel extends FlutterFlowModel<PwresetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? managername;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? reason;
  // Stores action output result for [Custom Action - adminResetPasswordAction] action in Button widget.
  bool? aaa;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
