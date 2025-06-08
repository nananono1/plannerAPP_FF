import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'daily_set_widget.dart' show DailySetWidget;
import 'package:flutter/material.dart';

class DailySetModel extends FlutterFlowModel<DailySetWidget> {
  ///  Local state fields for this component.

  PageStateSchemaStruct? addingPlannerInfo;
  void updateAddingPlannerInfoStruct(Function(PageStateSchemaStruct) updateFn) {
    updateFn(addingPlannerInfo ??= PageStateSchemaStruct());
  }

  Color? colorToSet = Color(4286559189);

  DateTime? timepicked1;

  DateTime? timepicked2;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in Container widget.
  DateTime? firsttime;
  // Stores action output result for [Custom Action - cupertinoTimePicker2] action in Container widget.
  DateTime? secondtime;
  // Stores action output result for [Custom Action - showCupertinoTimePicker] action in Container widget.
  String? aaa;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
