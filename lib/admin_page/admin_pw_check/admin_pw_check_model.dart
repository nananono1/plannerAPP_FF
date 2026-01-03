import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'admin_pw_check_widget.dart' show AdminPwCheckWidget;
import 'package:flutter/material.dart';

class AdminPwCheckModel extends FlutterFlowModel<AdminPwCheckWidget> {
  ///  Local state fields for this page.

  DateTime? pickeddate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminPwCheck widget.
  String? checkUserClaimAction;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? listIDPW;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? tf2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? tf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
