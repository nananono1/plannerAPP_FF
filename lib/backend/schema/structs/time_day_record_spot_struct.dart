// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TimeDayRecordSpotStruct extends FFFirebaseStruct {
  TimeDayRecordSpotStruct({
    double? averageTime,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _averageTime = averageTime,
        _date = date,
        super(firestoreUtilData);

  // "averageTime" field.
  double? _averageTime;
  double get averageTime => _averageTime ?? 0.0;
  set averageTime(double? val) => _averageTime = val;

  void incrementAverageTime(double amount) =>
      averageTime = averageTime + amount;

  bool hasAverageTime() => _averageTime != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static TimeDayRecordSpotStruct fromMap(Map<String, dynamic> data) =>
      TimeDayRecordSpotStruct(
        averageTime: castToType<double>(data['averageTime']),
        date: data['date'] as DateTime?,
      );

  static TimeDayRecordSpotStruct? maybeFromMap(dynamic data) => data is Map
      ? TimeDayRecordSpotStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'averageTime': _averageTime,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'averageTime': serializeParam(
          _averageTime,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TimeDayRecordSpotStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TimeDayRecordSpotStruct(
        averageTime: deserializeParam(
          data['averageTime'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TimeDayRecordSpotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimeDayRecordSpotStruct &&
        averageTime == other.averageTime &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([averageTime, date]);
}

TimeDayRecordSpotStruct createTimeDayRecordSpotStruct({
  double? averageTime,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimeDayRecordSpotStruct(
      averageTime: averageTime,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimeDayRecordSpotStruct? updateTimeDayRecordSpotStruct(
  TimeDayRecordSpotStruct? timeDayRecordSpot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timeDayRecordSpot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimeDayRecordSpotStructData(
  Map<String, dynamic> firestoreData,
  TimeDayRecordSpotStruct? timeDayRecordSpot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timeDayRecordSpot == null) {
    return;
  }
  if (timeDayRecordSpot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timeDayRecordSpot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timeDayRecordSpotData =
      getTimeDayRecordSpotFirestoreData(timeDayRecordSpot, forFieldValue);
  final nestedData =
      timeDayRecordSpotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timeDayRecordSpot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimeDayRecordSpotFirestoreData(
  TimeDayRecordSpotStruct? timeDayRecordSpot, [
  bool forFieldValue = false,
]) {
  if (timeDayRecordSpot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timeDayRecordSpot.toMap());

  // Add any Firestore field values
  timeDayRecordSpot.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimeDayRecordSpotListFirestoreData(
  List<TimeDayRecordSpotStruct>? timeDayRecordSpots,
) =>
    timeDayRecordSpots
        ?.map((e) => getTimeDayRecordSpotFirestoreData(e, true))
        .toList() ??
    [];
