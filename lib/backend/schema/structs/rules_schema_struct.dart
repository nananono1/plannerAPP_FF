// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RulesSchemaStruct extends FFFirebaseStruct {
  RulesSchemaStruct({
    String? rules,
    DateTime? publishDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rules = rules,
        _publishDate = publishDate,
        super(firestoreUtilData);

  // "rules" field.
  String? _rules;
  String get rules => _rules ?? '';
  set rules(String? val) => _rules = val;

  bool hasRules() => _rules != null;

  // "publishDate" field.
  DateTime? _publishDate;
  DateTime? get publishDate => _publishDate;
  set publishDate(DateTime? val) => _publishDate = val;

  bool hasPublishDate() => _publishDate != null;

  static RulesSchemaStruct fromMap(Map<String, dynamic> data) =>
      RulesSchemaStruct(
        rules: data['rules'] as String?,
        publishDate: data['publishDate'] as DateTime?,
      );

  static RulesSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? RulesSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rules': _rules,
        'publishDate': _publishDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rules': serializeParam(
          _rules,
          ParamType.String,
        ),
        'publishDate': serializeParam(
          _publishDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static RulesSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      RulesSchemaStruct(
        rules: deserializeParam(
          data['rules'],
          ParamType.String,
          false,
        ),
        publishDate: deserializeParam(
          data['publishDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'RulesSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RulesSchemaStruct &&
        rules == other.rules &&
        publishDate == other.publishDate;
  }

  @override
  int get hashCode => const ListEquality().hash([rules, publishDate]);
}

RulesSchemaStruct createRulesSchemaStruct({
  String? rules,
  DateTime? publishDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RulesSchemaStruct(
      rules: rules,
      publishDate: publishDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RulesSchemaStruct? updateRulesSchemaStruct(
  RulesSchemaStruct? rulesSchema, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rulesSchema
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRulesSchemaStructData(
  Map<String, dynamic> firestoreData,
  RulesSchemaStruct? rulesSchema,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rulesSchema == null) {
    return;
  }
  if (rulesSchema.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rulesSchema.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rulesSchemaData =
      getRulesSchemaFirestoreData(rulesSchema, forFieldValue);
  final nestedData =
      rulesSchemaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rulesSchema.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRulesSchemaFirestoreData(
  RulesSchemaStruct? rulesSchema, [
  bool forFieldValue = false,
]) {
  if (rulesSchema == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rulesSchema.toMap());

  // Add any Firestore field values
  rulesSchema.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRulesSchemaListFirestoreData(
  List<RulesSchemaStruct>? rulesSchemas,
) =>
    rulesSchemas?.map((e) => getRulesSchemaFirestoreData(e, true)).toList() ??
    [];
