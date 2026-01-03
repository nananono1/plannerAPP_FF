import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'adminplanner_page_widget.dart' show AdminplannerPageWidget;
import 'package:flutter/material.dart';

class AdminplannerPageModel extends FlutterFlowModel<AdminplannerPageWidget> {
  ///  Local state fields for this page.

  int? selectIndex;

  /// asc/des
  bool orderingType = false;

  /// true is seatNo, false is time
  bool orderingField = false;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminplannerPage widget.
  String? checkUserClaimAction;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<PlannerVariableListRecord>? bb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
