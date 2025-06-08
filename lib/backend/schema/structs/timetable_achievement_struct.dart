// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TimetableAchievementStruct extends FFFirebaseStruct {
  TimetableAchievementStruct({
    String? object,
    bool? hasDone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _object = object,
        _hasDone = hasDone,
        super(firestoreUtilData);

  // "object" field.
  String? _object;
  String get object => _object ?? '';
  set object(String? val) => _object = val;

  bool hasObject() => _object != null;

  // "hasDone" field.
  bool? _hasDone;
  bool get hasDone => _hasDone ?? false;
  set hasDone(bool? val) => _hasDone = val;

  bool hasHasDone() => _hasDone != null;

  static TimetableAchievementStruct fromMap(Map<String, dynamic> data) =>
      TimetableAchievementStruct(
        object: data['object'] as String?,
        hasDone: data['hasDone'] as bool?,
      );

  static TimetableAchievementStruct? maybeFromMap(dynamic data) => data is Map
      ? TimetableAchievementStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'object': _object,
        'hasDone': _hasDone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'object': serializeParam(
          _object,
          ParamType.String,
        ),
        'hasDone': serializeParam(
          _hasDone,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TimetableAchievementStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TimetableAchievementStruct(
        object: deserializeParam(
          data['object'],
          ParamType.String,
          false,
        ),
        hasDone: deserializeParam(
          data['hasDone'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TimetableAchievementStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimetableAchievementStruct &&
        object == other.object &&
        hasDone == other.hasDone;
  }

  @override
  int get hashCode => const ListEquality().hash([object, hasDone]);
}

TimetableAchievementStruct createTimetableAchievementStruct({
  String? object,
  bool? hasDone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimetableAchievementStruct(
      object: object,
      hasDone: hasDone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimetableAchievementStruct? updateTimetableAchievementStruct(
  TimetableAchievementStruct? timetableAchievement, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timetableAchievement
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimetableAchievementStructData(
  Map<String, dynamic> firestoreData,
  TimetableAchievementStruct? timetableAchievement,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timetableAchievement == null) {
    return;
  }
  if (timetableAchievement.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timetableAchievement.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timetableAchievementData =
      getTimetableAchievementFirestoreData(timetableAchievement, forFieldValue);
  final nestedData =
      timetableAchievementData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      timetableAchievement.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimetableAchievementFirestoreData(
  TimetableAchievementStruct? timetableAchievement, [
  bool forFieldValue = false,
]) {
  if (timetableAchievement == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timetableAchievement.toMap());

  // Add any Firestore field values
  timetableAchievement.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimetableAchievementListFirestoreData(
  List<TimetableAchievementStruct>? timetableAchievements,
) =>
    timetableAchievements
        ?.map((e) => getTimetableAchievementFirestoreData(e, true))
        .toList() ??
    [];
