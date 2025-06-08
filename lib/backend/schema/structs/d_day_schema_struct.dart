// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DDaySchemaStruct extends FFFirebaseStruct {
  DDaySchemaStruct({
    DateTime? dDay,
    bool? isImportant,
    String? ddayInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dDay = dDay,
        _isImportant = isImportant,
        _ddayInfo = ddayInfo,
        super(firestoreUtilData);

  // "dDay" field.
  DateTime? _dDay;
  DateTime? get dDay => _dDay;
  set dDay(DateTime? val) => _dDay = val;

  bool hasDDay() => _dDay != null;

  // "isImportant" field.
  bool? _isImportant;
  bool get isImportant => _isImportant ?? false;
  set isImportant(bool? val) => _isImportant = val;

  bool hasIsImportant() => _isImportant != null;

  // "ddayInfo" field.
  String? _ddayInfo;
  String get ddayInfo => _ddayInfo ?? '';
  set ddayInfo(String? val) => _ddayInfo = val;

  bool hasDdayInfo() => _ddayInfo != null;

  static DDaySchemaStruct fromMap(Map<String, dynamic> data) =>
      DDaySchemaStruct(
        dDay: data['dDay'] as DateTime?,
        isImportant: data['isImportant'] as bool?,
        ddayInfo: data['ddayInfo'] as String?,
      );

  static DDaySchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? DDaySchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dDay': _dDay,
        'isImportant': _isImportant,
        'ddayInfo': _ddayInfo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dDay': serializeParam(
          _dDay,
          ParamType.DateTime,
        ),
        'isImportant': serializeParam(
          _isImportant,
          ParamType.bool,
        ),
        'ddayInfo': serializeParam(
          _ddayInfo,
          ParamType.String,
        ),
      }.withoutNulls;

  static DDaySchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      DDaySchemaStruct(
        dDay: deserializeParam(
          data['dDay'],
          ParamType.DateTime,
          false,
        ),
        isImportant: deserializeParam(
          data['isImportant'],
          ParamType.bool,
          false,
        ),
        ddayInfo: deserializeParam(
          data['ddayInfo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DDaySchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DDaySchemaStruct &&
        dDay == other.dDay &&
        isImportant == other.isImportant &&
        ddayInfo == other.ddayInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([dDay, isImportant, ddayInfo]);
}

DDaySchemaStruct createDDaySchemaStruct({
  DateTime? dDay,
  bool? isImportant,
  String? ddayInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DDaySchemaStruct(
      dDay: dDay,
      isImportant: isImportant,
      ddayInfo: ddayInfo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DDaySchemaStruct? updateDDaySchemaStruct(
  DDaySchemaStruct? dDaySchema, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dDaySchema
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDDaySchemaStructData(
  Map<String, dynamic> firestoreData,
  DDaySchemaStruct? dDaySchema,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dDaySchema == null) {
    return;
  }
  if (dDaySchema.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dDaySchema.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dDaySchemaData = getDDaySchemaFirestoreData(dDaySchema, forFieldValue);
  final nestedData = dDaySchemaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dDaySchema.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDDaySchemaFirestoreData(
  DDaySchemaStruct? dDaySchema, [
  bool forFieldValue = false,
]) {
  if (dDaySchema == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dDaySchema.toMap());

  // Add any Firestore field values
  dDaySchema.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDDaySchemaListFirestoreData(
  List<DDaySchemaStruct>? dDaySchemas,
) =>
    dDaySchemas?.map((e) => getDDaySchemaFirestoreData(e, true)).toList() ?? [];
