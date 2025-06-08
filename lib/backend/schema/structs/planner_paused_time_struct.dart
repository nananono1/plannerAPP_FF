// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlannerPausedTimeStruct extends FFFirebaseStruct {
  PlannerPausedTimeStruct({
    DateTime? pausedTime,
    DateTime? resumeTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pausedTime = pausedTime,
        _resumeTime = resumeTime,
        super(firestoreUtilData);

  // "PausedTime" field.
  DateTime? _pausedTime;
  DateTime? get pausedTime => _pausedTime;
  set pausedTime(DateTime? val) => _pausedTime = val;

  bool hasPausedTime() => _pausedTime != null;

  // "ResumeTime" field.
  DateTime? _resumeTime;
  DateTime? get resumeTime => _resumeTime;
  set resumeTime(DateTime? val) => _resumeTime = val;

  bool hasResumeTime() => _resumeTime != null;

  static PlannerPausedTimeStruct fromMap(Map<String, dynamic> data) =>
      PlannerPausedTimeStruct(
        pausedTime: data['PausedTime'] as DateTime?,
        resumeTime: data['ResumeTime'] as DateTime?,
      );

  static PlannerPausedTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? PlannerPausedTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'PausedTime': _pausedTime,
        'ResumeTime': _resumeTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'PausedTime': serializeParam(
          _pausedTime,
          ParamType.DateTime,
        ),
        'ResumeTime': serializeParam(
          _resumeTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PlannerPausedTimeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PlannerPausedTimeStruct(
        pausedTime: deserializeParam(
          data['PausedTime'],
          ParamType.DateTime,
          false,
        ),
        resumeTime: deserializeParam(
          data['ResumeTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PlannerPausedTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlannerPausedTimeStruct &&
        pausedTime == other.pausedTime &&
        resumeTime == other.resumeTime;
  }

  @override
  int get hashCode => const ListEquality().hash([pausedTime, resumeTime]);
}

PlannerPausedTimeStruct createPlannerPausedTimeStruct({
  DateTime? pausedTime,
  DateTime? resumeTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlannerPausedTimeStruct(
      pausedTime: pausedTime,
      resumeTime: resumeTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlannerPausedTimeStruct? updatePlannerPausedTimeStruct(
  PlannerPausedTimeStruct? plannerPausedTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plannerPausedTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlannerPausedTimeStructData(
  Map<String, dynamic> firestoreData,
  PlannerPausedTimeStruct? plannerPausedTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plannerPausedTime == null) {
    return;
  }
  if (plannerPausedTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && plannerPausedTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final plannerPausedTimeData =
      getPlannerPausedTimeFirestoreData(plannerPausedTime, forFieldValue);
  final nestedData =
      plannerPausedTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = plannerPausedTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlannerPausedTimeFirestoreData(
  PlannerPausedTimeStruct? plannerPausedTime, [
  bool forFieldValue = false,
]) {
  if (plannerPausedTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plannerPausedTime.toMap());

  // Add any Firestore field values
  plannerPausedTime.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlannerPausedTimeListFirestoreData(
  List<PlannerPausedTimeStruct>? plannerPausedTimes,
) =>
    plannerPausedTimes
        ?.map((e) => getPlannerPausedTimeFirestoreData(e, true))
        .toList() ??
    [];
