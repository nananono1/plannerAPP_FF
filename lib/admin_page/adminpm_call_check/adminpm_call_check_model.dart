import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'adminpm_call_check_widget.dart' show AdminpmCallCheckWidget;
import 'package:flutter/material.dart';

class AdminpmCallCheckModel extends FlutterFlowModel<AdminpmCallCheckWidget> {
  ///  Local state fields for this page.

  DateTime? pickeddate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminpmCallCheck widget.
  String? checkUserClaimAction;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (RealtimeDatabase Read List Logic)] action in Icon widget.
  ApiCallResponse? apiResultmak;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
