import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'student_analytics_widget.dart' show StudentAnalyticsWidget;
import 'package:flutter/material.dart';

class StudentAnalyticsModel extends FlutterFlowModel<StudentAnalyticsWidget> {
  ///  Local state fields for this page.

  DateTime? startdate;

  DateTime? enddate;

  List<PageStateSchemaStruct> listeach = [];
  void addToListeach(PageStateSchemaStruct item) => listeach.add(item);
  void removeFromListeach(PageStateSchemaStruct item) => listeach.remove(item);
  void removeAtIndexFromListeach(int index) => listeach.removeAt(index);
  void insertAtIndexInListeach(int index, PageStateSchemaStruct item) =>
      listeach.insert(index, item);
  void updateListeachAtIndex(
          int index, Function(PageStateSchemaStruct) updateFn) =>
      listeach[index] = updateFn(listeach[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in studentAnalytics widget.
  StudyDBbackupAggRecord? aa;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
