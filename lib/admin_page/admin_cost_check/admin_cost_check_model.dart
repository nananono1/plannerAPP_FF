import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'admin_cost_check_widget.dart' show AdminCostCheckWidget;
import 'package:flutter/material.dart';

class AdminCostCheckModel extends FlutterFlowModel<AdminCostCheckWidget> {
  ///  Local state fields for this page.

  int? selectIndex;

  /// asc/des
  bool orderingType = false;

  /// true is seatNo, false is time
  bool orderingField = false;

  DateTime? startdate;

  DateTime? enddate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminCostCheck widget.
  String? checkUserClaimAction;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (a)] action in Icon widget.
  ApiCallResponse? apiResultpl9;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
