// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GradeInfoStruct extends FFFirebaseStruct {
  GradeInfoStruct({
    String? subject,
    String? select,
    int? grade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _select = select,
        _grade = grade,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? ' ';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "select" field.
  String? _select;
  String get select => _select ?? ' ';
  set select(String? val) => _select = val;

  bool hasSelect() => _select != null;

  // "grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  set grade(int? val) => _grade = val;

  void incrementGrade(int amount) => grade = grade + amount;

  bool hasGrade() => _grade != null;

  static GradeInfoStruct fromMap(Map<String, dynamic> data) => GradeInfoStruct(
        subject: data['subject'] as String?,
        select: data['select'] as String?,
        grade: castToType<int>(data['grade']),
      );

  static GradeInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? GradeInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'select': _select,
        'grade': _grade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'select': serializeParam(
          _select,
          ParamType.String,
        ),
        'grade': serializeParam(
          _grade,
          ParamType.int,
        ),
      }.withoutNulls;

  static GradeInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      GradeInfoStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        select: deserializeParam(
          data['select'],
          ParamType.String,
          false,
        ),
        grade: deserializeParam(
          data['grade'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GradeInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GradeInfoStruct &&
        subject == other.subject &&
        select == other.select &&
        grade == other.grade;
  }

  @override
  int get hashCode => const ListEquality().hash([subject, select, grade]);
}

GradeInfoStruct createGradeInfoStruct({
  String? subject,
  String? select,
  int? grade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GradeInfoStruct(
      subject: subject,
      select: select,
      grade: grade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GradeInfoStruct? updateGradeInfoStruct(
  GradeInfoStruct? gradeInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gradeInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGradeInfoStructData(
  Map<String, dynamic> firestoreData,
  GradeInfoStruct? gradeInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gradeInfo == null) {
    return;
  }
  if (gradeInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gradeInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gradeInfoData = getGradeInfoFirestoreData(gradeInfo, forFieldValue);
  final nestedData = gradeInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gradeInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGradeInfoFirestoreData(
  GradeInfoStruct? gradeInfo, [
  bool forFieldValue = false,
]) {
  if (gradeInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gradeInfo.toMap());

  // Add any Firestore field values
  gradeInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGradeInfoListFirestoreData(
  List<GradeInfoStruct>? gradeInfos,
) =>
    gradeInfos?.map((e) => getGradeInfoFirestoreData(e, true)).toList() ?? [];
