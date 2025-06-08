// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyTimeTableStruct extends FFFirebaseStruct {
  WeeklyTimeTableStruct({
    DocumentReference? uid,
    String? tablename,
    DailyTimeTableFormatStruct? mon,
    DailyTimeTableFormatStruct? tue,
    DailyTimeTableFormatStruct? wed,
    DailyTimeTableFormatStruct? thu,
    DailyTimeTableFormatStruct? fri,
    DailyTimeTableFormatStruct? sat,
    DailyTimeTableFormatStruct? sun,
    DateTime? updatedDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _tablename = tablename,
        _mon = mon,
        _tue = tue,
        _wed = wed,
        _thu = thu,
        _fri = fri,
        _sat = sat,
        _sun = sun,
        _updatedDate = updatedDate,
        super(firestoreUtilData);

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  set uid(DocumentReference? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "tablename" field.
  String? _tablename;
  String get tablename => _tablename ?? '';
  set tablename(String? val) => _tablename = val;

  bool hasTablename() => _tablename != null;

  // "mon" field.
  DailyTimeTableFormatStruct? _mon;
  DailyTimeTableFormatStruct get mon => _mon ?? DailyTimeTableFormatStruct();
  set mon(DailyTimeTableFormatStruct? val) => _mon = val;

  void updateMon(Function(DailyTimeTableFormatStruct) updateFn) {
    updateFn(_mon ??= DailyTimeTableFormatStruct());
  }

  bool hasMon() => _mon != null;

  // "tue" field.
  DailyTimeTableFormatStruct? _tue;
  DailyTimeTableFormatStruct get tue => _tue ?? DailyTimeTableFormatStruct();
  set tue(DailyTimeTableFormatStruct? val) => _tue = val;

  void updateTue(Function(DailyTimeTableFormatStruct) updateFn) {
    updateFn(_tue ??= DailyTimeTableFormatStruct());
  }

  bool hasTue() => _tue != null;

  // "wed" field.
  DailyTimeTableFormatStruct? _wed;
  DailyTimeTableFormatStruct get wed => _wed ?? DailyTimeTableFormatStruct();
  set wed(DailyTimeTableFormatStruct? val) => _wed = val;

  void updateWed(Function(DailyTimeTableFormatStruct) updateFn) {
    updateFn(_wed ??= DailyTimeTableFormatStruct());
  }

  bool hasWed() => _wed != null;

  // "thu" field.
  DailyTimeTableFormatStruct? _thu;
  DailyTimeTableFormatStruct get thu => _thu ?? DailyTimeTableFormatStruct();
  set thu(DailyTimeTableFormatStruct? val) => _thu = val;

  void updateThu(Function(DailyTimeTableFormatStruct) updateFn) {
    updateFn(_thu ??= DailyTimeTableFormatStruct());
  }

  bool hasThu() => _thu != null;

  // "fri" field.
  DailyTimeTableFormatStruct? _fri;
  DailyTimeTableFormatStruct get fri => _fri ?? DailyTimeTableFormatStruct();
  set fri(DailyTimeTableFormatStruct? val) => _fri = val;

  void updateFri(Function(DailyTimeTableFormatStruct) updateFn) {
    updateFn(_fri ??= DailyTimeTableFormatStruct());
  }

  bool hasFri() => _fri != null;

  // "sat" field.
  DailyTimeTableFormatStruct? _sat;
  DailyTimeTableFormatStruct get sat => _sat ?? DailyTimeTableFormatStruct();
  set sat(DailyTimeTableFormatStruct? val) => _sat = val;

  void updateSat(Function(DailyTimeTableFormatStruct) updateFn) {
    updateFn(_sat ??= DailyTimeTableFormatStruct());
  }

  bool hasSat() => _sat != null;

  // "sun" field.
  DailyTimeTableFormatStruct? _sun;
  DailyTimeTableFormatStruct get sun => _sun ?? DailyTimeTableFormatStruct();
  set sun(DailyTimeTableFormatStruct? val) => _sun = val;

  void updateSun(Function(DailyTimeTableFormatStruct) updateFn) {
    updateFn(_sun ??= DailyTimeTableFormatStruct());
  }

  bool hasSun() => _sun != null;

  // "updatedDate" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  set updatedDate(DateTime? val) => _updatedDate = val;

  bool hasUpdatedDate() => _updatedDate != null;

  static WeeklyTimeTableStruct fromMap(Map<String, dynamic> data) =>
      WeeklyTimeTableStruct(
        uid: data['uid'] as DocumentReference?,
        tablename: data['tablename'] as String?,
        mon: data['mon'] is DailyTimeTableFormatStruct
            ? data['mon']
            : DailyTimeTableFormatStruct.maybeFromMap(data['mon']),
        tue: data['tue'] is DailyTimeTableFormatStruct
            ? data['tue']
            : DailyTimeTableFormatStruct.maybeFromMap(data['tue']),
        wed: data['wed'] is DailyTimeTableFormatStruct
            ? data['wed']
            : DailyTimeTableFormatStruct.maybeFromMap(data['wed']),
        thu: data['thu'] is DailyTimeTableFormatStruct
            ? data['thu']
            : DailyTimeTableFormatStruct.maybeFromMap(data['thu']),
        fri: data['fri'] is DailyTimeTableFormatStruct
            ? data['fri']
            : DailyTimeTableFormatStruct.maybeFromMap(data['fri']),
        sat: data['sat'] is DailyTimeTableFormatStruct
            ? data['sat']
            : DailyTimeTableFormatStruct.maybeFromMap(data['sat']),
        sun: data['sun'] is DailyTimeTableFormatStruct
            ? data['sun']
            : DailyTimeTableFormatStruct.maybeFromMap(data['sun']),
        updatedDate: data['updatedDate'] as DateTime?,
      );

  static WeeklyTimeTableStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyTimeTableStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'tablename': _tablename,
        'mon': _mon?.toMap(),
        'tue': _tue?.toMap(),
        'wed': _wed?.toMap(),
        'thu': _thu?.toMap(),
        'fri': _fri?.toMap(),
        'sat': _sat?.toMap(),
        'sun': _sun?.toMap(),
        'updatedDate': _updatedDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.DocumentReference,
        ),
        'tablename': serializeParam(
          _tablename,
          ParamType.String,
        ),
        'mon': serializeParam(
          _mon,
          ParamType.DataStruct,
        ),
        'tue': serializeParam(
          _tue,
          ParamType.DataStruct,
        ),
        'wed': serializeParam(
          _wed,
          ParamType.DataStruct,
        ),
        'thu': serializeParam(
          _thu,
          ParamType.DataStruct,
        ),
        'fri': serializeParam(
          _fri,
          ParamType.DataStruct,
        ),
        'sat': serializeParam(
          _sat,
          ParamType.DataStruct,
        ),
        'sun': serializeParam(
          _sun,
          ParamType.DataStruct,
        ),
        'updatedDate': serializeParam(
          _updatedDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static WeeklyTimeTableStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyTimeTableStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        tablename: deserializeParam(
          data['tablename'],
          ParamType.String,
          false,
        ),
        mon: deserializeStructParam(
          data['mon'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTimeTableFormatStruct.fromSerializableMap,
        ),
        tue: deserializeStructParam(
          data['tue'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTimeTableFormatStruct.fromSerializableMap,
        ),
        wed: deserializeStructParam(
          data['wed'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTimeTableFormatStruct.fromSerializableMap,
        ),
        thu: deserializeStructParam(
          data['thu'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTimeTableFormatStruct.fromSerializableMap,
        ),
        fri: deserializeStructParam(
          data['fri'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTimeTableFormatStruct.fromSerializableMap,
        ),
        sat: deserializeStructParam(
          data['sat'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTimeTableFormatStruct.fromSerializableMap,
        ),
        sun: deserializeStructParam(
          data['sun'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyTimeTableFormatStruct.fromSerializableMap,
        ),
        updatedDate: deserializeParam(
          data['updatedDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'WeeklyTimeTableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeeklyTimeTableStruct &&
        uid == other.uid &&
        tablename == other.tablename &&
        mon == other.mon &&
        tue == other.tue &&
        wed == other.wed &&
        thu == other.thu &&
        fri == other.fri &&
        sat == other.sat &&
        sun == other.sun &&
        updatedDate == other.updatedDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([uid, tablename, mon, tue, wed, thu, fri, sat, sun, updatedDate]);
}

WeeklyTimeTableStruct createWeeklyTimeTableStruct({
  DocumentReference? uid,
  String? tablename,
  DailyTimeTableFormatStruct? mon,
  DailyTimeTableFormatStruct? tue,
  DailyTimeTableFormatStruct? wed,
  DailyTimeTableFormatStruct? thu,
  DailyTimeTableFormatStruct? fri,
  DailyTimeTableFormatStruct? sat,
  DailyTimeTableFormatStruct? sun,
  DateTime? updatedDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyTimeTableStruct(
      uid: uid,
      tablename: tablename,
      mon: mon ?? (clearUnsetFields ? DailyTimeTableFormatStruct() : null),
      tue: tue ?? (clearUnsetFields ? DailyTimeTableFormatStruct() : null),
      wed: wed ?? (clearUnsetFields ? DailyTimeTableFormatStruct() : null),
      thu: thu ?? (clearUnsetFields ? DailyTimeTableFormatStruct() : null),
      fri: fri ?? (clearUnsetFields ? DailyTimeTableFormatStruct() : null),
      sat: sat ?? (clearUnsetFields ? DailyTimeTableFormatStruct() : null),
      sun: sun ?? (clearUnsetFields ? DailyTimeTableFormatStruct() : null),
      updatedDate: updatedDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyTimeTableStruct? updateWeeklyTimeTableStruct(
  WeeklyTimeTableStruct? weeklyTimeTable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyTimeTable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyTimeTableStructData(
  Map<String, dynamic> firestoreData,
  WeeklyTimeTableStruct? weeklyTimeTable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyTimeTable == null) {
    return;
  }
  if (weeklyTimeTable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyTimeTable.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyTimeTableData =
      getWeeklyTimeTableFirestoreData(weeklyTimeTable, forFieldValue);
  final nestedData =
      weeklyTimeTableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyTimeTable.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyTimeTableFirestoreData(
  WeeklyTimeTableStruct? weeklyTimeTable, [
  bool forFieldValue = false,
]) {
  if (weeklyTimeTable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyTimeTable.toMap());

  // Handle nested data for "mon" field.
  addDailyTimeTableFormatStructData(
    firestoreData,
    weeklyTimeTable.hasMon() ? weeklyTimeTable.mon : null,
    'mon',
    forFieldValue,
  );

  // Handle nested data for "tue" field.
  addDailyTimeTableFormatStructData(
    firestoreData,
    weeklyTimeTable.hasTue() ? weeklyTimeTable.tue : null,
    'tue',
    forFieldValue,
  );

  // Handle nested data for "wed" field.
  addDailyTimeTableFormatStructData(
    firestoreData,
    weeklyTimeTable.hasWed() ? weeklyTimeTable.wed : null,
    'wed',
    forFieldValue,
  );

  // Handle nested data for "thu" field.
  addDailyTimeTableFormatStructData(
    firestoreData,
    weeklyTimeTable.hasThu() ? weeklyTimeTable.thu : null,
    'thu',
    forFieldValue,
  );

  // Handle nested data for "fri" field.
  addDailyTimeTableFormatStructData(
    firestoreData,
    weeklyTimeTable.hasFri() ? weeklyTimeTable.fri : null,
    'fri',
    forFieldValue,
  );

  // Handle nested data for "sat" field.
  addDailyTimeTableFormatStructData(
    firestoreData,
    weeklyTimeTable.hasSat() ? weeklyTimeTable.sat : null,
    'sat',
    forFieldValue,
  );

  // Handle nested data for "sun" field.
  addDailyTimeTableFormatStructData(
    firestoreData,
    weeklyTimeTable.hasSun() ? weeklyTimeTable.sun : null,
    'sun',
    forFieldValue,
  );

  // Add any Firestore field values
  weeklyTimeTable.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyTimeTableListFirestoreData(
  List<WeeklyTimeTableStruct>? weeklyTimeTables,
) =>
    weeklyTimeTables
        ?.map((e) => getWeeklyTimeTableFirestoreData(e, true))
        .toList() ??
    [];
