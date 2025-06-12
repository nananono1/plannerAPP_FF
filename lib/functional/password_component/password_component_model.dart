import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'password_component_widget.dart' show PasswordComponentWidget;
import 'package:flutter/material.dart';

class PasswordComponentModel extends FlutterFlowModel<PasswordComponentWidget> {
  ///  Local state fields for this component.

  PageStateSchemaStruct? addingPlannerInfo;
  void updateAddingPlannerInfoStruct(Function(PageStateSchemaStruct) updateFn) {
    updateFn(addingPlannerInfo ??= PageStateSchemaStruct());
  }

  Color colorToSet = Color(4278222848);

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
