// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PointInputStruct extends FFFirebaseStruct {
  PointInputStruct({
    int? pointGet,
    DateTime? getDate,
    String? reasonWhy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pointGet = pointGet,
        _getDate = getDate,
        _reasonWhy = reasonWhy,
        super(firestoreUtilData);

  // "pointGet" field.
  int? _pointGet;
  int get pointGet => _pointGet ?? 0;
  set pointGet(int? val) => _pointGet = val;

  void incrementPointGet(int amount) => pointGet = pointGet + amount;

  bool hasPointGet() => _pointGet != null;

  // "getDate" field.
  DateTime? _getDate;
  DateTime? get getDate => _getDate;
  set getDate(DateTime? val) => _getDate = val;

  bool hasGetDate() => _getDate != null;

  // "reasonWhy" field.
  String? _reasonWhy;
  String get reasonWhy => _reasonWhy ?? '';
  set reasonWhy(String? val) => _reasonWhy = val;

  bool hasReasonWhy() => _reasonWhy != null;

  static PointInputStruct fromMap(Map<String, dynamic> data) =>
      PointInputStruct(
        pointGet: castToType<int>(data['pointGet']),
        getDate: data['getDate'] as DateTime?,
        reasonWhy: data['reasonWhy'] as String?,
      );

  static PointInputStruct? maybeFromMap(dynamic data) => data is Map
      ? PointInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pointGet': _pointGet,
        'getDate': _getDate,
        'reasonWhy': _reasonWhy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pointGet': serializeParam(
          _pointGet,
          ParamType.int,
        ),
        'getDate': serializeParam(
          _getDate,
          ParamType.DateTime,
        ),
        'reasonWhy': serializeParam(
          _reasonWhy,
          ParamType.String,
        ),
      }.withoutNulls;

  static PointInputStruct fromSerializableMap(Map<String, dynamic> data) =>
      PointInputStruct(
        pointGet: deserializeParam(
          data['pointGet'],
          ParamType.int,
          false,
        ),
        getDate: deserializeParam(
          data['getDate'],
          ParamType.DateTime,
          false,
        ),
        reasonWhy: deserializeParam(
          data['reasonWhy'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PointInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PointInputStruct &&
        pointGet == other.pointGet &&
        getDate == other.getDate &&
        reasonWhy == other.reasonWhy;
  }

  @override
  int get hashCode => const ListEquality().hash([pointGet, getDate, reasonWhy]);
}

PointInputStruct createPointInputStruct({
  int? pointGet,
  DateTime? getDate,
  String? reasonWhy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PointInputStruct(
      pointGet: pointGet,
      getDate: getDate,
      reasonWhy: reasonWhy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PointInputStruct? updatePointInputStruct(
  PointInputStruct? pointInput, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pointInput
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPointInputStructData(
  Map<String, dynamic> firestoreData,
  PointInputStruct? pointInput,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pointInput == null) {
    return;
  }
  if (pointInput.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pointInput.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pointInputData = getPointInputFirestoreData(pointInput, forFieldValue);
  final nestedData = pointInputData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pointInput.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPointInputFirestoreData(
  PointInputStruct? pointInput, [
  bool forFieldValue = false,
]) {
  if (pointInput == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pointInput.toMap());

  // Add any Firestore field values
  pointInput.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPointInputListFirestoreData(
  List<PointInputStruct>? pointInputs,
) =>
    pointInputs?.map((e) => getPointInputFirestoreData(e, true)).toList() ?? [];
