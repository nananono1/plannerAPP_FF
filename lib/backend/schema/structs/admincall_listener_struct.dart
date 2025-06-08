// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AdmincallListenerStruct extends FFFirebaseStruct {
  AdmincallListenerStruct({
    String? callreason,
    DateTime? calltime,
    bool? checked,
    String? seatno,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _callreason = callreason,
        _calltime = calltime,
        _checked = checked,
        _seatno = seatno,
        super(firestoreUtilData);

  // "callreason" field.
  String? _callreason;
  String get callreason => _callreason ?? '';
  set callreason(String? val) => _callreason = val;

  bool hasCallreason() => _callreason != null;

  // "calltime" field.
  DateTime? _calltime;
  DateTime? get calltime => _calltime;
  set calltime(DateTime? val) => _calltime = val;

  bool hasCalltime() => _calltime != null;

  // "checked" field.
  bool? _checked;
  bool get checked => _checked ?? false;
  set checked(bool? val) => _checked = val;

  bool hasChecked() => _checked != null;

  // "seatno" field.
  String? _seatno;
  String get seatno => _seatno ?? '';
  set seatno(String? val) => _seatno = val;

  bool hasSeatno() => _seatno != null;

  static AdmincallListenerStruct fromMap(Map<String, dynamic> data) =>
      AdmincallListenerStruct(
        callreason: data['callreason'] as String?,
        calltime: data['calltime'] as DateTime?,
        checked: data['checked'] as bool?,
        seatno: data['seatno'] as String?,
      );

  static AdmincallListenerStruct? maybeFromMap(dynamic data) => data is Map
      ? AdmincallListenerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'callreason': _callreason,
        'calltime': _calltime,
        'checked': _checked,
        'seatno': _seatno,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'callreason': serializeParam(
          _callreason,
          ParamType.String,
        ),
        'calltime': serializeParam(
          _calltime,
          ParamType.DateTime,
        ),
        'checked': serializeParam(
          _checked,
          ParamType.bool,
        ),
        'seatno': serializeParam(
          _seatno,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdmincallListenerStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AdmincallListenerStruct(
        callreason: deserializeParam(
          data['callreason'],
          ParamType.String,
          false,
        ),
        calltime: deserializeParam(
          data['calltime'],
          ParamType.DateTime,
          false,
        ),
        checked: deserializeParam(
          data['checked'],
          ParamType.bool,
          false,
        ),
        seatno: deserializeParam(
          data['seatno'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdmincallListenerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdmincallListenerStruct &&
        callreason == other.callreason &&
        calltime == other.calltime &&
        checked == other.checked &&
        seatno == other.seatno;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([callreason, calltime, checked, seatno]);
}

AdmincallListenerStruct createAdmincallListenerStruct({
  String? callreason,
  DateTime? calltime,
  bool? checked,
  String? seatno,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdmincallListenerStruct(
      callreason: callreason,
      calltime: calltime,
      checked: checked,
      seatno: seatno,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdmincallListenerStruct? updateAdmincallListenerStruct(
  AdmincallListenerStruct? admincallListener, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    admincallListener
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdmincallListenerStructData(
  Map<String, dynamic> firestoreData,
  AdmincallListenerStruct? admincallListener,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (admincallListener == null) {
    return;
  }
  if (admincallListener.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && admincallListener.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final admincallListenerData =
      getAdmincallListenerFirestoreData(admincallListener, forFieldValue);
  final nestedData =
      admincallListenerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = admincallListener.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdmincallListenerFirestoreData(
  AdmincallListenerStruct? admincallListener, [
  bool forFieldValue = false,
]) {
  if (admincallListener == null) {
    return {};
  }
  final firestoreData = mapToFirestore(admincallListener.toMap());

  // Add any Firestore field values
  admincallListener.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdmincallListenerListFirestoreData(
  List<AdmincallListenerStruct>? admincallListeners,
) =>
    admincallListeners
        ?.map((e) => getAdmincallListenerFirestoreData(e, true))
        .toList() ??
    [];
