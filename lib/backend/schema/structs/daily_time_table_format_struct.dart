// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyTimeTableFormatStruct extends FFFirebaseStruct {
  DailyTimeTableFormatStruct({
    DateTime? naegongStartTime,
    DateTime? naegongEndTime,
    List<DailyOutingStruct>? dailyoutingList,
    bool? nonExistingDate,
    Color? dayNaegongColor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _naegongStartTime = naegongStartTime,
        _naegongEndTime = naegongEndTime,
        _dailyoutingList = dailyoutingList,
        _nonExistingDate = nonExistingDate,
        _dayNaegongColor = dayNaegongColor,
        super(firestoreUtilData);

  // "naegongStartTime" field.
  DateTime? _naegongStartTime;
  DateTime? get naegongStartTime => _naegongStartTime;
  set naegongStartTime(DateTime? val) => _naegongStartTime = val;

  bool hasNaegongStartTime() => _naegongStartTime != null;

  // "naegongEndTime" field.
  DateTime? _naegongEndTime;
  DateTime? get naegongEndTime => _naegongEndTime;
  set naegongEndTime(DateTime? val) => _naegongEndTime = val;

  bool hasNaegongEndTime() => _naegongEndTime != null;

  // "dailyoutingList" field.
  List<DailyOutingStruct>? _dailyoutingList;
  List<DailyOutingStruct> get dailyoutingList => _dailyoutingList ?? const [];
  set dailyoutingList(List<DailyOutingStruct>? val) => _dailyoutingList = val;

  void updateDailyoutingList(Function(List<DailyOutingStruct>) updateFn) {
    updateFn(_dailyoutingList ??= []);
  }

  bool hasDailyoutingList() => _dailyoutingList != null;

  // "nonExistingDate" field.
  bool? _nonExistingDate;
  bool get nonExistingDate => _nonExistingDate ?? false;
  set nonExistingDate(bool? val) => _nonExistingDate = val;

  bool hasNonExistingDate() => _nonExistingDate != null;

  // "dayNaegongColor" field.
  Color? _dayNaegongColor;
  Color? get dayNaegongColor => _dayNaegongColor;
  set dayNaegongColor(Color? val) => _dayNaegongColor = val;

  bool hasDayNaegongColor() => _dayNaegongColor != null;

  static DailyTimeTableFormatStruct fromMap(Map<String, dynamic> data) =>
      DailyTimeTableFormatStruct(
        naegongStartTime: data['naegongStartTime'] as DateTime?,
        naegongEndTime: data['naegongEndTime'] as DateTime?,
        dailyoutingList: getStructList(
          data['dailyoutingList'],
          DailyOutingStruct.fromMap,
        ),
        nonExistingDate: data['nonExistingDate'] as bool?,
        dayNaegongColor: getSchemaColor(data['dayNaegongColor']),
      );

  static DailyTimeTableFormatStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyTimeTableFormatStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'naegongStartTime': _naegongStartTime,
        'naegongEndTime': _naegongEndTime,
        'dailyoutingList': _dailyoutingList?.map((e) => e.toMap()).toList(),
        'nonExistingDate': _nonExistingDate,
        'dayNaegongColor': _dayNaegongColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'naegongStartTime': serializeParam(
          _naegongStartTime,
          ParamType.DateTime,
        ),
        'naegongEndTime': serializeParam(
          _naegongEndTime,
          ParamType.DateTime,
        ),
        'dailyoutingList': serializeParam(
          _dailyoutingList,
          ParamType.DataStruct,
          isList: true,
        ),
        'nonExistingDate': serializeParam(
          _nonExistingDate,
          ParamType.bool,
        ),
        'dayNaegongColor': serializeParam(
          _dayNaegongColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static DailyTimeTableFormatStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DailyTimeTableFormatStruct(
        naegongStartTime: deserializeParam(
          data['naegongStartTime'],
          ParamType.DateTime,
          false,
        ),
        naegongEndTime: deserializeParam(
          data['naegongEndTime'],
          ParamType.DateTime,
          false,
        ),
        dailyoutingList: deserializeStructParam<DailyOutingStruct>(
          data['dailyoutingList'],
          ParamType.DataStruct,
          true,
          structBuilder: DailyOutingStruct.fromSerializableMap,
        ),
        nonExistingDate: deserializeParam(
          data['nonExistingDate'],
          ParamType.bool,
          false,
        ),
        dayNaegongColor: deserializeParam(
          data['dayNaegongColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'DailyTimeTableFormatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DailyTimeTableFormatStruct &&
        naegongStartTime == other.naegongStartTime &&
        naegongEndTime == other.naegongEndTime &&
        listEquality.equals(dailyoutingList, other.dailyoutingList) &&
        nonExistingDate == other.nonExistingDate &&
        dayNaegongColor == other.dayNaegongColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        naegongStartTime,
        naegongEndTime,
        dailyoutingList,
        nonExistingDate,
        dayNaegongColor
      ]);
}

DailyTimeTableFormatStruct createDailyTimeTableFormatStruct({
  DateTime? naegongStartTime,
  DateTime? naegongEndTime,
  bool? nonExistingDate,
  Color? dayNaegongColor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyTimeTableFormatStruct(
      naegongStartTime: naegongStartTime,
      naegongEndTime: naegongEndTime,
      nonExistingDate: nonExistingDate,
      dayNaegongColor: dayNaegongColor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyTimeTableFormatStruct? updateDailyTimeTableFormatStruct(
  DailyTimeTableFormatStruct? dailyTimeTableFormat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyTimeTableFormat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyTimeTableFormatStructData(
  Map<String, dynamic> firestoreData,
  DailyTimeTableFormatStruct? dailyTimeTableFormat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyTimeTableFormat == null) {
    return;
  }
  if (dailyTimeTableFormat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyTimeTableFormat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyTimeTableFormatData =
      getDailyTimeTableFormatFirestoreData(dailyTimeTableFormat, forFieldValue);
  final nestedData =
      dailyTimeTableFormatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dailyTimeTableFormat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyTimeTableFormatFirestoreData(
  DailyTimeTableFormatStruct? dailyTimeTableFormat, [
  bool forFieldValue = false,
]) {
  if (dailyTimeTableFormat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyTimeTableFormat.toMap());

  // Add any Firestore field values
  dailyTimeTableFormat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyTimeTableFormatListFirestoreData(
  List<DailyTimeTableFormatStruct>? dailyTimeTableFormats,
) =>
    dailyTimeTableFormats
        ?.map((e) => getDailyTimeTableFormatFirestoreData(e, true))
        .toList() ??
    [];
