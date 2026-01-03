import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'admin_seat_change_widget.dart' show AdminSeatChangeWidget;
import 'package:flutter/material.dart';

class AdminSeatChangeModel extends FlutterFlowModel<AdminSeatChangeWidget> {
  ///  Local state fields for this page.

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminSeatChange widget.
  String? checkUserClaimAction;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
