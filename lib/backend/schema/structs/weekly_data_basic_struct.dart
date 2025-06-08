// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyDataBasicStruct extends FFFirebaseStruct {
  WeeklyDataBasicStruct({
    String? title,
    DateTime? starttime,
    DateTime? endtime,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _starttime = starttime,
        _endtime = endtime,
        _color = color,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "starttime" field.
  DateTime? _starttime;
  DateTime? get starttime => _starttime;
  set starttime(DateTime? val) => _starttime = val;

  bool hasStarttime() => _starttime != null;

  // "endtime" field.
  DateTime? _endtime;
  DateTime? get endtime => _endtime;
  set endtime(DateTime? val) => _endtime = val;

  bool hasEndtime() => _endtime != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static WeeklyDataBasicStruct fromMap(Map<String, dynamic> data) =>
      WeeklyDataBasicStruct(
        title: data['title'] as String?,
        starttime: data['starttime'] as DateTime?,
        endtime: data['endtime'] as DateTime?,
        color: getSchemaColor(data['color']),
      );

  static WeeklyDataBasicStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyDataBasicStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'starttime': _starttime,
        'endtime': _endtime,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'starttime': serializeParam(
          _starttime,
          ParamType.DateTime,
        ),
        'endtime': serializeParam(
          _endtime,
          ParamType.DateTime,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static WeeklyDataBasicStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyDataBasicStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        starttime: deserializeParam(
          data['starttime'],
          ParamType.DateTime,
          false,
        ),
        endtime: deserializeParam(
          data['endtime'],
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
  String toString() => 'WeeklyDataBasicStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeeklyDataBasicStruct &&
        title == other.title &&
        starttime == other.starttime &&
        endtime == other.endtime &&
        color == other.color;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, starttime, endtime, color]);
}

WeeklyDataBasicStruct createWeeklyDataBasicStruct({
  String? title,
  DateTime? starttime,
  DateTime? endtime,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyDataBasicStruct(
      title: title,
      starttime: starttime,
      endtime: endtime,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyDataBasicStruct? updateWeeklyDataBasicStruct(
  WeeklyDataBasicStruct? weeklyDataBasic, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyDataBasic
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyDataBasicStructData(
  Map<String, dynamic> firestoreData,
  WeeklyDataBasicStruct? weeklyDataBasic,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyDataBasic == null) {
    return;
  }
  if (weeklyDataBasic.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyDataBasic.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyDataBasicData =
      getWeeklyDataBasicFirestoreData(weeklyDataBasic, forFieldValue);
  final nestedData =
      weeklyDataBasicData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyDataBasic.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyDataBasicFirestoreData(
  WeeklyDataBasicStruct? weeklyDataBasic, [
  bool forFieldValue = false,
]) {
  if (weeklyDataBasic == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyDataBasic.toMap());

  // Add any Firestore field values
  weeklyDataBasic.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyDataBasicListFirestoreData(
  List<WeeklyDataBasicStruct>? weeklyDataBasics,
) =>
    weeklyDataBasics
        ?.map((e) => getWeeklyDataBasicFirestoreData(e, true))
        .toList() ??
    [];
