// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SpotStudytimeEachStruct extends FFFirebaseStruct {
  SpotStudytimeEachStruct({
    DateTime? date,
    double? averageStudyTime,
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
  double? _averageStudyTime;
  double get averageStudyTime => _averageStudyTime ?? 0.0;
  set averageStudyTime(double? val) => _averageStudyTime = val;

  void incrementAverageStudyTime(double amount) =>
      averageStudyTime = averageStudyTime + amount;

  bool hasAverageStudyTime() => _averageStudyTime != null;

  static SpotStudytimeEachStruct fromMap(Map<String, dynamic> data) =>
      SpotStudytimeEachStruct(
        date: data['date'] as DateTime?,
        averageStudyTime: castToType<double>(data['averageStudyTime']),
      );

  static SpotStudytimeEachStruct? maybeFromMap(dynamic data) => data is Map
      ? SpotStudytimeEachStruct.fromMap(data.cast<String, dynamic>())
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
          ParamType.double,
        ),
      }.withoutNulls;

  static SpotStudytimeEachStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SpotStudytimeEachStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        averageStudyTime: deserializeParam(
          data['averageStudyTime'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SpotStudytimeEachStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpotStudytimeEachStruct &&
        date == other.date &&
        averageStudyTime == other.averageStudyTime;
  }

  @override
  int get hashCode => const ListEquality().hash([date, averageStudyTime]);
}

SpotStudytimeEachStruct createSpotStudytimeEachStruct({
  DateTime? date,
  double? averageStudyTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpotStudytimeEachStruct(
      date: date,
      averageStudyTime: averageStudyTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpotStudytimeEachStruct? updateSpotStudytimeEachStruct(
  SpotStudytimeEachStruct? spotStudytimeEach, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spotStudytimeEach
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpotStudytimeEachStructData(
  Map<String, dynamic> firestoreData,
  SpotStudytimeEachStruct? spotStudytimeEach,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spotStudytimeEach == null) {
    return;
  }
  if (spotStudytimeEach.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spotStudytimeEach.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spotStudytimeEachData =
      getSpotStudytimeEachFirestoreData(spotStudytimeEach, forFieldValue);
  final nestedData =
      spotStudytimeEachData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spotStudytimeEach.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpotStudytimeEachFirestoreData(
  SpotStudytimeEachStruct? spotStudytimeEach, [
  bool forFieldValue = false,
]) {
  if (spotStudytimeEach == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spotStudytimeEach.toMap());

  // Add any Firestore field values
  spotStudytimeEach.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpotStudytimeEachListFirestoreData(
  List<SpotStudytimeEachStruct>? spotStudytimeEachs,
) =>
    spotStudytimeEachs
        ?.map((e) => getSpotStudytimeEachFirestoreData(e, true))
        .toList() ??
    [];
