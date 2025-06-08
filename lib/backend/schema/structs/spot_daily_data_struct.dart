// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SpotDailyDataStruct extends FFFirebaseStruct {
  SpotDailyDataStruct({
    DateTime? date,
    int? averageStudyTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _averageStudyTime = averageStudyTime,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "averageStudyTime" field.
  int? _averageStudyTime;
  int get averageStudyTime => _averageStudyTime ?? 0;
  set averageStudyTime(int? val) => _averageStudyTime = val;

  void incrementAverageStudyTime(int amount) =>
      averageStudyTime = averageStudyTime + amount;

  bool hasAverageStudyTime() => _averageStudyTime != null;

  static SpotDailyDataStruct fromMap(Map<String, dynamic> data) =>
      SpotDailyDataStruct(
        date: data['date'] as DateTime?,
        averageStudyTime: castToType<int>(data['averageStudyTime']),
      );

  static SpotDailyDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SpotDailyDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'averageStudyTime': _averageStudyTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'averageStudyTime': serializeParam(
          _averageStudyTime,
          ParamType.int,
        ),
      }.withoutNulls;

  static SpotDailyDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpotDailyDataStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        averageStudyTime: deserializeParam(
          data['averageStudyTime'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SpotDailyDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpotDailyDataStruct &&
        date == other.date &&
        averageStudyTime == other.averageStudyTime;
  }

  @override
  int get hashCode => const ListEquality().hash([date, averageStudyTime]);
}

SpotDailyDataStruct createSpotDailyDataStruct({
  DateTime? date,
  int? averageStudyTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpotDailyDataStruct(
      date: date,
      averageStudyTime: averageStudyTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpotDailyDataStruct? updateSpotDailyDataStruct(
  SpotDailyDataStruct? spotDailyData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spotDailyData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpotDailyDataStructData(
  Map<String, dynamic> firestoreData,
  SpotDailyDataStruct? spotDailyData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spotDailyData == null) {
    return;
  }
  if (spotDailyData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spotDailyData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spotDailyDataData =
      getSpotDailyDataFirestoreData(spotDailyData, forFieldValue);
  final nestedData =
      spotDailyDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spotDailyData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpotDailyDataFirestoreData(
  SpotDailyDataStruct? spotDailyData, [
  bool forFieldValue = false,
]) {
  if (spotDailyData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spotDailyData.toMap());

  // Add any Firestore field values
  spotDailyData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpotDailyDataListFirestoreData(
  List<SpotDailyDataStruct>? spotDailyDatas,
) =>
    spotDailyDatas
        ?.map((e) => getSpotDailyDataFirestoreData(e, true))
        .toList() ??
    [];
