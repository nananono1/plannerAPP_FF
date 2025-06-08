// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklydataWeeklyStruct extends FFFirebaseStruct {
  WeeklydataWeeklyStruct({
    List<WeeklyDataBasicStruct>? mon,
    List<WeeklyDataBasicStruct>? tue,
    List<WeeklyDataBasicStruct>? wed,
    List<WeeklyDataBasicStruct>? thu,
    List<WeeklyDataBasicStruct>? fri,
    List<WeeklyDataBasicStruct>? sat,
    List<WeeklyDataBasicStruct>? sun,
    bool? isOn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mon = mon,
        _tue = tue,
        _wed = wed,
        _thu = thu,
        _fri = fri,
        _sat = sat,
        _sun = sun,
        _isOn = isOn,
        super(firestoreUtilData);

  // "mon" field.
  List<WeeklyDataBasicStruct>? _mon;
  List<WeeklyDataBasicStruct> get mon => _mon ?? const [];
  set mon(List<WeeklyDataBasicStruct>? val) => _mon = val;

  void updateMon(Function(List<WeeklyDataBasicStruct>) updateFn) {
    updateFn(_mon ??= []);
  }

  bool hasMon() => _mon != null;

  // "tue" field.
  List<WeeklyDataBasicStruct>? _tue;
  List<WeeklyDataBasicStruct> get tue => _tue ?? const [];
  set tue(List<WeeklyDataBasicStruct>? val) => _tue = val;

  void updateTue(Function(List<WeeklyDataBasicStruct>) updateFn) {
    updateFn(_tue ??= []);
  }

  bool hasTue() => _tue != null;

  // "wed" field.
  List<WeeklyDataBasicStruct>? _wed;
  List<WeeklyDataBasicStruct> get wed => _wed ?? const [];
  set wed(List<WeeklyDataBasicStruct>? val) => _wed = val;

  void updateWed(Function(List<WeeklyDataBasicStruct>) updateFn) {
    updateFn(_wed ??= []);
  }

  bool hasWed() => _wed != null;

  // "thu" field.
  List<WeeklyDataBasicStruct>? _thu;
  List<WeeklyDataBasicStruct> get thu => _thu ?? const [];
  set thu(List<WeeklyDataBasicStruct>? val) => _thu = val;

  void updateThu(Function(List<WeeklyDataBasicStruct>) updateFn) {
    updateFn(_thu ??= []);
  }

  bool hasThu() => _thu != null;

  // "fri" field.
  List<WeeklyDataBasicStruct>? _fri;
  List<WeeklyDataBasicStruct> get fri => _fri ?? const [];
  set fri(List<WeeklyDataBasicStruct>? val) => _fri = val;

  void updateFri(Function(List<WeeklyDataBasicStruct>) updateFn) {
    updateFn(_fri ??= []);
  }

  bool hasFri() => _fri != null;

  // "sat" field.
  List<WeeklyDataBasicStruct>? _sat;
  List<WeeklyDataBasicStruct> get sat => _sat ?? const [];
  set sat(List<WeeklyDataBasicStruct>? val) => _sat = val;

  void updateSat(Function(List<WeeklyDataBasicStruct>) updateFn) {
    updateFn(_sat ??= []);
  }

  bool hasSat() => _sat != null;

  // "sun" field.
  List<WeeklyDataBasicStruct>? _sun;
  List<WeeklyDataBasicStruct> get sun => _sun ?? const [];
  set sun(List<WeeklyDataBasicStruct>? val) => _sun = val;

  void updateSun(Function(List<WeeklyDataBasicStruct>) updateFn) {
    updateFn(_sun ??= []);
  }

  bool hasSun() => _sun != null;

  // "isOn" field.
  bool? _isOn;
  bool get isOn => _isOn ?? false;
  set isOn(bool? val) => _isOn = val;

  bool hasIsOn() => _isOn != null;

  static WeeklydataWeeklyStruct fromMap(Map<String, dynamic> data) =>
      WeeklydataWeeklyStruct(
        mon: getStructList(
          data['mon'],
          WeeklyDataBasicStruct.fromMap,
        ),
        tue: getStructList(
          data['tue'],
          WeeklyDataBasicStruct.fromMap,
        ),
        wed: getStructList(
          data['wed'],
          WeeklyDataBasicStruct.fromMap,
        ),
        thu: getStructList(
          data['thu'],
          WeeklyDataBasicStruct.fromMap,
        ),
        fri: getStructList(
          data['fri'],
          WeeklyDataBasicStruct.fromMap,
        ),
        sat: getStructList(
          data['sat'],
          WeeklyDataBasicStruct.fromMap,
        ),
        sun: getStructList(
          data['sun'],
          WeeklyDataBasicStruct.fromMap,
        ),
        isOn: data['isOn'] as bool?,
      );

  static WeeklydataWeeklyStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklydataWeeklyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mon': _mon?.map((e) => e.toMap()).toList(),
        'tue': _tue?.map((e) => e.toMap()).toList(),
        'wed': _wed?.map((e) => e.toMap()).toList(),
        'thu': _thu?.map((e) => e.toMap()).toList(),
        'fri': _fri?.map((e) => e.toMap()).toList(),
        'sat': _sat?.map((e) => e.toMap()).toList(),
        'sun': _sun?.map((e) => e.toMap()).toList(),
        'isOn': _isOn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mon': serializeParam(
          _mon,
          ParamType.DataStruct,
          isList: true,
        ),
        'tue': serializeParam(
          _tue,
          ParamType.DataStruct,
          isList: true,
        ),
        'wed': serializeParam(
          _wed,
          ParamType.DataStruct,
          isList: true,
        ),
        'thu': serializeParam(
          _thu,
          ParamType.DataStruct,
          isList: true,
        ),
        'fri': serializeParam(
          _fri,
          ParamType.DataStruct,
          isList: true,
        ),
        'sat': serializeParam(
          _sat,
          ParamType.DataStruct,
          isList: true,
        ),
        'sun': serializeParam(
          _sun,
          ParamType.DataStruct,
          isList: true,
        ),
        'isOn': serializeParam(
          _isOn,
          ParamType.bool,
        ),
      }.withoutNulls;

  static WeeklydataWeeklyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WeeklydataWeeklyStruct(
        mon: deserializeStructParam<WeeklyDataBasicStruct>(
          data['mon'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklyDataBasicStruct.fromSerializableMap,
        ),
        tue: deserializeStructParam<WeeklyDataBasicStruct>(
          data['tue'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklyDataBasicStruct.fromSerializableMap,
        ),
        wed: deserializeStructParam<WeeklyDataBasicStruct>(
          data['wed'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklyDataBasicStruct.fromSerializableMap,
        ),
        thu: deserializeStructParam<WeeklyDataBasicStruct>(
          data['thu'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklyDataBasicStruct.fromSerializableMap,
        ),
        fri: deserializeStructParam<WeeklyDataBasicStruct>(
          data['fri'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklyDataBasicStruct.fromSerializableMap,
        ),
        sat: deserializeStructParam<WeeklyDataBasicStruct>(
          data['sat'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklyDataBasicStruct.fromSerializableMap,
        ),
        sun: deserializeStructParam<WeeklyDataBasicStruct>(
          data['sun'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklyDataBasicStruct.fromSerializableMap,
        ),
        isOn: deserializeParam(
          data['isOn'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'WeeklydataWeeklyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WeeklydataWeeklyStruct &&
        listEquality.equals(mon, other.mon) &&
        listEquality.equals(tue, other.tue) &&
        listEquality.equals(wed, other.wed) &&
        listEquality.equals(thu, other.thu) &&
        listEquality.equals(fri, other.fri) &&
        listEquality.equals(sat, other.sat) &&
        listEquality.equals(sun, other.sun) &&
        isOn == other.isOn;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([mon, tue, wed, thu, fri, sat, sun, isOn]);
}

WeeklydataWeeklyStruct createWeeklydataWeeklyStruct({
  bool? isOn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklydataWeeklyStruct(
      isOn: isOn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklydataWeeklyStruct? updateWeeklydataWeeklyStruct(
  WeeklydataWeeklyStruct? weeklydataWeekly, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklydataWeekly
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklydataWeeklyStructData(
  Map<String, dynamic> firestoreData,
  WeeklydataWeeklyStruct? weeklydataWeekly,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklydataWeekly == null) {
    return;
  }
  if (weeklydataWeekly.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklydataWeekly.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklydataWeeklyData =
      getWeeklydataWeeklyFirestoreData(weeklydataWeekly, forFieldValue);
  final nestedData =
      weeklydataWeeklyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklydataWeekly.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklydataWeeklyFirestoreData(
  WeeklydataWeeklyStruct? weeklydataWeekly, [
  bool forFieldValue = false,
]) {
  if (weeklydataWeekly == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklydataWeekly.toMap());

  // Add any Firestore field values
  weeklydataWeekly.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklydataWeeklyListFirestoreData(
  List<WeeklydataWeeklyStruct>? weeklydataWeeklys,
) =>
    weeklydataWeeklys
        ?.map((e) => getWeeklydataWeeklyFirestoreData(e, true))
        .toList() ??
    [];
