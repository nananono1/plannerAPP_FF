// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CrashBackUpDataStruct extends FFFirebaseStruct {
  CrashBackUpDataStruct({
    String? subNameBackup,
    String? studiedDetailedBackup,
    int? indexIDBackup,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subNameBackup = subNameBackup,
        _studiedDetailedBackup = studiedDetailedBackup,
        _indexIDBackup = indexIDBackup,
        super(firestoreUtilData);

  // "subNameBackup" field.
  String? _subNameBackup;
  String get subNameBackup => _subNameBackup ?? '';
  set subNameBackup(String? val) => _subNameBackup = val;

  bool hasSubNameBackup() => _subNameBackup != null;

  // "studiedDetailedBackup" field.
  String? _studiedDetailedBackup;
  String get studiedDetailedBackup => _studiedDetailedBackup ?? '';
  set studiedDetailedBackup(String? val) => _studiedDetailedBackup = val;

  bool hasStudiedDetailedBackup() => _studiedDetailedBackup != null;

  // "indexIDBackup" field.
  int? _indexIDBackup;
  int get indexIDBackup => _indexIDBackup ?? 0;
  set indexIDBackup(int? val) => _indexIDBackup = val;

  void incrementIndexIDBackup(int amount) =>
      indexIDBackup = indexIDBackup + amount;

  bool hasIndexIDBackup() => _indexIDBackup != null;

  static CrashBackUpDataStruct fromMap(Map<String, dynamic> data) =>
      CrashBackUpDataStruct(
        subNameBackup: data['subNameBackup'] as String?,
        studiedDetailedBackup: data['studiedDetailedBackup'] as String?,
        indexIDBackup: castToType<int>(data['indexIDBackup']),
      );

  static CrashBackUpDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CrashBackUpDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subNameBackup': _subNameBackup,
        'studiedDetailedBackup': _studiedDetailedBackup,
        'indexIDBackup': _indexIDBackup,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subNameBackup': serializeParam(
          _subNameBackup,
          ParamType.String,
        ),
        'studiedDetailedBackup': serializeParam(
          _studiedDetailedBackup,
          ParamType.String,
        ),
        'indexIDBackup': serializeParam(
          _indexIDBackup,
          ParamType.int,
        ),
      }.withoutNulls;

  static CrashBackUpDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CrashBackUpDataStruct(
        subNameBackup: deserializeParam(
          data['subNameBackup'],
          ParamType.String,
          false,
        ),
        studiedDetailedBackup: deserializeParam(
          data['studiedDetailedBackup'],
          ParamType.String,
          false,
        ),
        indexIDBackup: deserializeParam(
          data['indexIDBackup'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CrashBackUpDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CrashBackUpDataStruct &&
        subNameBackup == other.subNameBackup &&
        studiedDetailedBackup == other.studiedDetailedBackup &&
        indexIDBackup == other.indexIDBackup;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subNameBackup, studiedDetailedBackup, indexIDBackup]);
}

CrashBackUpDataStruct createCrashBackUpDataStruct({
  String? subNameBackup,
  String? studiedDetailedBackup,
  int? indexIDBackup,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CrashBackUpDataStruct(
      subNameBackup: subNameBackup,
      studiedDetailedBackup: studiedDetailedBackup,
      indexIDBackup: indexIDBackup,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CrashBackUpDataStruct? updateCrashBackUpDataStruct(
  CrashBackUpDataStruct? crashBackUpData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    crashBackUpData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCrashBackUpDataStructData(
  Map<String, dynamic> firestoreData,
  CrashBackUpDataStruct? crashBackUpData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (crashBackUpData == null) {
    return;
  }
  if (crashBackUpData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && crashBackUpData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final crashBackUpDataData =
      getCrashBackUpDataFirestoreData(crashBackUpData, forFieldValue);
  final nestedData =
      crashBackUpDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = crashBackUpData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCrashBackUpDataFirestoreData(
  CrashBackUpDataStruct? crashBackUpData, [
  bool forFieldValue = false,
]) {
  if (crashBackUpData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(crashBackUpData.toMap());

  // Add any Firestore field values
  crashBackUpData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCrashBackUpDataListFirestoreData(
  List<CrashBackUpDataStruct>? crashBackUpDatas,
) =>
    crashBackUpDatas
        ?.map((e) => getCrashBackUpDataFirestoreData(e, true))
        .toList() ??
    [];
