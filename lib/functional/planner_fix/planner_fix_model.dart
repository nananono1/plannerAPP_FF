import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'planner_fix_widget.dart' show PlannerFixWidget;
import 'package:flutter/material.dart';

class PlannerFixModel extends FlutterFlowModel<PlannerFixWidget> {
  ///  Local state fields for this component.

  PlannerInputStruct? addingPlannerInfo;
  void updateAddingPlannerInfoStruct(Function(PlannerInputStruct) updateFn) {
    updateFn(addingPlannerInfo ??= PlannerInputStruct());
  }

  String? subNamePassToFix;

  String? whatIdonePassToFix;

  Color? colorPassToFix;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  Color? colorPicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
