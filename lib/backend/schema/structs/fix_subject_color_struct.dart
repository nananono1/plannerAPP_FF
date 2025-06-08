// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FixSubjectColorStruct extends FFFirebaseStruct {
  FixSubjectColorStruct({
    String? subjectToFix,
    Color? colorToFix,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subjectToFix = subjectToFix,
        _colorToFix = colorToFix,
        super(firestoreUtilData);

  // "subjectToFix" field.
  String? _subjectToFix;
  String get subjectToFix => _subjectToFix ?? '';
  set subjectToFix(String? val) => _subjectToFix = val;

  bool hasSubjectToFix() => _subjectToFix != null;

  // "colorToFix" field.
  Color? _colorToFix;
  Color? get colorToFix => _colorToFix;
  set colorToFix(Color? val) => _colorToFix = val;

  bool hasColorToFix() => _colorToFix != null;

  static FixSubjectColorStruct fromMap(Map<String, dynamic> data) =>
      FixSubjectColorStruct(
        subjectToFix: data['subjectToFix'] as String?,
        colorToFix: getSchemaColor(data['colorToFix']),
      );

  static FixSubjectColorStruct? maybeFromMap(dynamic data) => data is Map
      ? FixSubjectColorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subjectToFix': _subjectToFix,
        'colorToFix': _colorToFix,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subjectToFix': serializeParam(
          _subjectToFix,
          ParamType.String,
        ),
        'colorToFix': serializeParam(
          _colorToFix,
          ParamType.Color,
        ),
      }.withoutNulls;

  static FixSubjectColorStruct fromSerializableMap(Map<String, dynamic> data) =>
      FixSubjectColorStruct(
        subjectToFix: deserializeParam(
          data['subjectToFix'],
          ParamType.String,
          false,
        ),
        colorToFix: deserializeParam(
          data['colorToFix'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'FixSubjectColorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FixSubjectColorStruct &&
        subjectToFix == other.subjectToFix &&
        colorToFix == other.colorToFix;
  }

  @override
  int get hashCode => const ListEquality().hash([subjectToFix, colorToFix]);
}

FixSubjectColorStruct createFixSubjectColorStruct({
  String? subjectToFix,
  Color? colorToFix,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FixSubjectColorStruct(
      subjectToFix: subjectToFix,
      colorToFix: colorToFix,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FixSubjectColorStruct? updateFixSubjectColorStruct(
  FixSubjectColorStruct? fixSubjectColor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fixSubjectColor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFixSubjectColorStructData(
  Map<String, dynamic> firestoreData,
  FixSubjectColorStruct? fixSubjectColor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fixSubjectColor == null) {
    return;
  }
  if (fixSubjectColor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fixSubjectColor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fixSubjectColorData =
      getFixSubjectColorFirestoreData(fixSubjectColor, forFieldValue);
  final nestedData =
      fixSubjectColorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fixSubjectColor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFixSubjectColorFirestoreData(
  FixSubjectColorStruct? fixSubjectColor, [
  bool forFieldValue = false,
]) {
  if (fixSubjectColor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fixSubjectColor.toMap());

  // Add any Firestore field values
  fixSubjectColor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFixSubjectColorListFirestoreData(
  List<FixSubjectColorStruct>? fixSubjectColors,
) =>
    fixSubjectColors
        ?.map((e) => getFixSubjectColorFirestoreData(e, true))
        .toList() ??
    [];
