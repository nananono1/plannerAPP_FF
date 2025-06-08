import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'adminpm_study_check_widget.dart' show AdminpmStudyCheckWidget;
import 'package:flutter/material.dart';

class AdminpmStudyCheckModel extends FlutterFlowModel<AdminpmStudyCheckWidget> {
  ///  Local state fields for this page.

  DateTime? startdate;

  DateTime? enddate;

  int? selectedIndex;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminpmStudyCheck widget.
  String? checkUserClaimAction;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? dddd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
