// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalSubjectEachStruct extends FFFirebaseStruct {
  PersonalSubjectEachStruct({
    String? subject,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _color = color,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static PersonalSubjectEachStruct fromMap(Map<String, dynamic> data) =>
      PersonalSubjectEachStruct(
        subject: data['subject'] as String?,
        color: getSchemaColor(data['color']),
      );

  static PersonalSubjectEachStruct? maybeFromMap(dynamic data) => data is Map
      ? PersonalSubjectEachStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static PersonalSubjectEachStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PersonalSubjectEachStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'PersonalSubjectEachStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonalSubjectEachStruct &&
        subject == other.subject &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([subject, color]);
}

PersonalSubjectEachStruct createPersonalSubjectEachStruct({
  String? subject,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PersonalSubjectEachStruct(
      subject: subject,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PersonalSubjectEachStruct? updatePersonalSubjectEachStruct(
  PersonalSubjectEachStruct? personalSubjectEach, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    personalSubjectEach
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPersonalSubjectEachStructData(
  Map<String, dynamic> firestoreData,
  PersonalSubjectEachStruct? personalSubjectEach,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (personalSubjectEach == null) {
    return;
  }
  if (personalSubjectEach.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && personalSubjectEach.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final personalSubjectEachData =
      getPersonalSubjectEachFirestoreData(personalSubjectEach, forFieldValue);
  final nestedData =
      personalSubjectEachData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      personalSubjectEach.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPersonalSubjectEachFirestoreData(
  PersonalSubjectEachStruct? personalSubjectEach, [
  bool forFieldValue = false,
]) {
  if (personalSubjectEach == null) {
    return {};
  }
  final firestoreData = mapToFirestore(personalSubjectEach.toMap());

  // Add any Firestore field values
  personalSubjectEach.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPersonalSubjectEachListFirestoreData(
  List<PersonalSubjectEachStruct>? personalSubjectEachs,
) =>
    personalSubjectEachs
        ?.map((e) => getPersonalSubjectEachFirestoreData(e, true))
        .toList() ??
    [];
