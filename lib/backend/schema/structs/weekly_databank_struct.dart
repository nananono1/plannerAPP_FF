// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyDatabankStruct extends FFFirebaseStruct {
  WeeklyDatabankStruct({
    List<WeeklydataWeeklyStruct>? banks,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _banks = banks,
        super(firestoreUtilData);

  // "banks" field.
  List<WeeklydataWeeklyStruct>? _banks;
  List<WeeklydataWeeklyStruct> get banks => _banks ?? const [];
  set banks(List<WeeklydataWeeklyStruct>? val) => _banks = val;

  void updateBanks(Function(List<WeeklydataWeeklyStruct>) updateFn) {
    updateFn(_banks ??= []);
  }

  bool hasBanks() => _banks != null;

  static WeeklyDatabankStruct fromMap(Map<String, dynamic> data) =>
      WeeklyDatabankStruct(
        banks: getStructList(
          data['banks'],
          WeeklydataWeeklyStruct.fromMap,
        ),
      );

  static WeeklyDatabankStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyDatabankStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'banks': _banks?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'banks': serializeParam(
          _banks,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static WeeklyDatabankStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyDatabankStruct(
        banks: deserializeStructParam<WeeklydataWeeklyStruct>(
          data['banks'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeklydataWeeklyStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WeeklyDatabankStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WeeklyDatabankStruct &&
        listEquality.equals(banks, other.banks);
  }

  @override
  int get hashCode => const ListEquality().hash([banks]);
}

WeeklyDatabankStruct createWeeklyDatabankStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyDatabankStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyDatabankStruct? updateWeeklyDatabankStruct(
  WeeklyDatabankStruct? weeklyDatabank, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyDatabank
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyDatabankStructData(
  Map<String, dynamic> firestoreData,
  WeeklyDatabankStruct? weeklyDatabank,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyDatabank == null) {
    return;
  }
  if (weeklyDatabank.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyDatabank.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyDatabankData =
      getWeeklyDatabankFirestoreData(weeklyDatabank, forFieldValue);
  final nestedData =
      weeklyDatabankData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyDatabank.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyDatabankFirestoreData(
  WeeklyDatabankStruct? weeklyDatabank, [
  bool forFieldValue = false,
]) {
  if (weeklyDatabank == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyDatabank.toMap());

  // Add any Firestore field values
  weeklyDatabank.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyDatabankListFirestoreData(
  List<WeeklyDatabankStruct>? weeklyDatabanks,
) =>
    weeklyDatabanks
        ?.map((e) => getWeeklyDatabankFirestoreData(e, true))
        .toList() ??
    [];
