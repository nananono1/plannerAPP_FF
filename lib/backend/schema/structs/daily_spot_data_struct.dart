// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DailySpotDataStruct extends FFFirebaseStruct {
  DailySpotDataStruct({
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static DailySpotDataStruct fromMap(Map<String, dynamic> data) =>
      DailySpotDataStruct(
        date: data['date'] as DateTime?,
      );

  static DailySpotDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DailySpotDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DailySpotDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailySpotDataStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DailySpotDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailySpotDataStruct && date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([date]);
}

DailySpotDataStruct createDailySpotDataStruct({
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailySpotDataStruct(
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailySpotDataStruct? updateDailySpotDataStruct(
  DailySpotDataStruct? dailySpotData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailySpotData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailySpotDataStructData(
  Map<String, dynamic> firestoreData,
  DailySpotDataStruct? dailySpotData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailySpotData == null) {
    return;
  }
  if (dailySpotData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailySpotData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailySpotDataData =
      getDailySpotDataFirestoreData(dailySpotData, forFieldValue);
  final nestedData =
      dailySpotDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailySpotData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailySpotDataFirestoreData(
  DailySpotDataStruct? dailySpotData, [
  bool forFieldValue = false,
]) {
  if (dailySpotData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailySpotData.toMap());

  // Add any Firestore field values
  dailySpotData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailySpotDataListFirestoreData(
  List<DailySpotDataStruct>? dailySpotDatas,
) =>
    dailySpotDatas
        ?.map((e) => getDailySpotDataFirestoreData(e, true))
        .toList() ??
    [];
