import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'planner_inut_set_copy_widget.dart' show PlannerInutSetCopyWidget;
import 'package:flutter/material.dart';

class PlannerInutSetCopyModel
    extends FlutterFlowModel<PlannerInutSetCopyWidget> {
  ///  Local state fields for this component.

  PageStateSchemaStruct? addingPlannerInfo;
  void updateAddingPlannerInfoStruct(Function(PageStateSchemaStruct) updateFn) {
    updateFn(addingPlannerInfo ??= PageStateSchemaStruct());
  }

  Color colorToSet = Color(4278222848);

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
