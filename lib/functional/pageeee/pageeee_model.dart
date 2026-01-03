import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pageeee_widget.dart' show PageeeeWidget;
import 'package:flutter/material.dart';

class PageeeeModel extends FlutterFlowModel<PageeeeWidget> {
  ///  Local state fields for this page.
  /// 0
  double? localxStart = 0.0;

  /// 0
  double? localxEnd = 0.0;

  double? length0 = 50.0;

  bool focusIsSet = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in pageeee widget.
  PlannerVariableListRecord? firstquery;
  // Stores action output result for [Firestore Query - Query a collection] action in pageeee widget.
  PlannerVariableListRecord? queryToday777;
  // Stores action output result for [Firestore Query - Query a collection] action in pageeee widget.
  PlannerVariableListRecord? loadedInfo66;
  // Stores action output result for [Firestore Query - Query a collection] action in contentView_1 widget.
  StudyDBbackupAggRecord? aa1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  PlannerVariableListRecord? queryToday1;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  PlannerVariableListRecord? loadedInfoCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  PlannerVariableListRecord? queryToday2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  PlannerVariableListRecord? loadedInfoCopyCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  PlannerVariableListRecord? queryToday3;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  PlannerVariableListRecord? loadedInfo;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  PlannerVariableListRecord? quuerytoupdate;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? asss;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
