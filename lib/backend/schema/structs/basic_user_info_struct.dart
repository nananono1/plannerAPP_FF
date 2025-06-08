// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BasicUserInfoStruct extends FFFirebaseStruct {
  BasicUserInfoStruct({
    String? uid,
    String? userName,
    int? userSeatNo,
    String? userSpot,
    DateTime? timenow,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _userName = userName,
        _userSeatNo = userSeatNo,
        _userSpot = userSpot,
        _timenow = timenow,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "userSeatNo" field.
  int? _userSeatNo;
  int get userSeatNo => _userSeatNo ?? 0;
  set userSeatNo(int? val) => _userSeatNo = val;

  void incrementUserSeatNo(int amount) => userSeatNo = userSeatNo + amount;

  bool hasUserSeatNo() => _userSeatNo != null;

  // "userSpot" field.
  String? _userSpot;
  String get userSpot => _userSpot ?? '';
  set userSpot(String? val) => _userSpot = val;

  bool hasUserSpot() => _userSpot != null;

  // "timenow" field.
  DateTime? _timenow;
  DateTime? get timenow => _timenow;
  set timenow(DateTime? val) => _timenow = val;

  bool hasTimenow() => _timenow != null;

  static BasicUserInfoStruct fromMap(Map<String, dynamic> data) =>
      BasicUserInfoStruct(
        uid: data['uid'] as String?,
        userName: data['userName'] as String?,
        userSeatNo: castToType<int>(data['userSeatNo']),
        userSpot: data['userSpot'] as String?,
        timenow: data['timenow'] as DateTime?,
      );

  static BasicUserInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? BasicUserInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'userName': _userName,
        'userSeatNo': _userSeatNo,
        'userSpot': _userSpot,
        'timenow': _timenow,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'userSeatNo': serializeParam(
          _userSeatNo,
          ParamType.int,
        ),
        'userSpot': serializeParam(
          _userSpot,
          ParamType.String,
        ),
        'timenow': serializeParam(
          _timenow,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static BasicUserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      BasicUserInfoStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userSeatNo: deserializeParam(
          data['userSeatNo'],
          ParamType.int,
          false,
        ),
        userSpot: deserializeParam(
          data['userSpot'],
          ParamType.String,
          false,
        ),
        timenow: deserializeParam(
          data['timenow'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'BasicUserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BasicUserInfoStruct &&
        uid == other.uid &&
        userName == other.userName &&
        userSeatNo == other.userSeatNo &&
        userSpot == other.userSpot &&
        timenow == other.timenow;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([uid, userName, userSeatNo, userSpot, timenow]);
}

BasicUserInfoStruct createBasicUserInfoStruct({
  String? uid,
  String? userName,
  int? userSeatNo,
  String? userSpot,
  DateTime? timenow,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BasicUserInfoStruct(
      uid: uid,
      userName: userName,
      userSeatNo: userSeatNo,
      userSpot: userSpot,
      timenow: timenow,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BasicUserInfoStruct? updateBasicUserInfoStruct(
  BasicUserInfoStruct? basicUserInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    basicUserInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBasicUserInfoStructData(
  Map<String, dynamic> firestoreData,
  BasicUserInfoStruct? basicUserInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (basicUserInfo == null) {
    return;
  }
  if (basicUserInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && basicUserInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final basicUserInfoData =
      getBasicUserInfoFirestoreData(basicUserInfo, forFieldValue);
  final nestedData =
      basicUserInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = basicUserInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBasicUserInfoFirestoreData(
  BasicUserInfoStruct? basicUserInfo, [
  bool forFieldValue = false,
]) {
  if (basicUserInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(basicUserInfo.toMap());

  // Add any Firestore field values
  basicUserInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBasicUserInfoListFirestoreData(
  List<BasicUserInfoStruct>? basicUserInfos,
) =>
    basicUserInfos
        ?.map((e) => getBasicUserInfoFirestoreData(e, true))
        .toList() ??
    [];
