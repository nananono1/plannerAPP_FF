// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyOutingStruct extends FFFirebaseStruct {
  DailyOutingStruct({
    String? reason,
    DateTime? outingstarttime,
    DateTime? outingendtime,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _reason = reason,
        _outingstarttime = outingstarttime,
        _outingendtime = outingendtime,
        _color = color,
        super(firestoreUtilData);

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  set reason(String? val) => _reason = val;

  bool hasReason() => _reason != null;

  // "outingstarttime" field.
  DateTime? _outingstarttime;
  DateTime? get outingstarttime => _outingstarttime;
  set outingstarttime(DateTime? val) => _outingstarttime = val;

  bool hasOutingstarttime() => _outingstarttime != null;

  // "outingendtime" field.
  DateTime? _outingendtime;
  DateTime? get outingendtime => _outingendtime;
  set outingendtime(DateTime? val) => _outingendtime = val;

  bool hasOutingendtime() => _outingendtime != null;

  // "color" field.
  Color? _color;
  Color get color => _color ?? const Color(0xFFD6FFC8);
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static DailyOutingStruct fromMap(Map<String, dynamic> data) =>
      DailyOutingStruct(
        reason: data['reason'] as String?,
        outingstarttime: data['outingstarttime'] as DateTime?,
        outingendtime: data['outingendtime'] as DateTime?,
        color: getSchemaColor(data['color']),
      );

  static DailyOutingStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyOutingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'reason': _reason,
        'outingstarttime': _outingstarttime,
        'outingendtime': _outingendtime,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'reason': serializeParam(
          _reason,
          ParamType.String,
        ),
        'outingstarttime': serializeParam(
          _outingstarttime,
          ParamType.DateTime,
        ),
        'outingendtime': serializeParam(
          _outingendtime,
          ParamType.DateTime,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static DailyOutingStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailyOutingStruct(
        reason: deserializeParam(
          data['reason'],
          ParamType.String,
          false,
        ),
        outingstarttime: deserializeParam(
          data['outingstarttime'],
          ParamType.DateTime,
          false,
        ),
        outingendtime: deserializeParam(
          data['outingendtime'],
          ParamType.DateTime,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'DailyOutingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyOutingStruct &&
        reason == other.reason &&
        outingstarttime == other.outingstarttime &&
        outingendtime == other.outingendtime &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([reason, outingstarttime, outingendtime, color]);
}

DailyOutingStruct createDailyOutingStruct({
  String? reason,
  DateTime? outingstarttime,
  DateTime? outingendtime,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyOutingStruct(
      reason: reason,
      outingstarttime: outingstarttime,
      outingendtime: outingendtime,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyOutingStruct? updateDailyOutingStruct(
  DailyOutingStruct? dailyOuting, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyOuting
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyOutingStructData(
  Map<String, dynamic> firestoreData,
  DailyOutingStruct? dailyOuting,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyOuting == null) {
    return;
  }
  if (dailyOuting.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyOuting.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyOutingData =
      getDailyOutingFirestoreData(dailyOuting, forFieldValue);
  final nestedData =
      dailyOutingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailyOuting.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyOutingFirestoreData(
  DailyOutingStruct? dailyOuting, [
  bool forFieldValue = false,
]) {
  if (dailyOuting == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyOuting.toMap());

  // Add any Firestore field values
  dailyOuting.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyOutingListFirestoreData(
  List<DailyOutingStruct>? dailyOutings,
) =>
    dailyOutings?.map((e) => getDailyOutingFirestoreData(e, true)).toList() ??
    [];
