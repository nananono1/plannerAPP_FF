// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PenaltyInputEachStruct extends FFFirebaseStruct {
  PenaltyInputEachStruct({
    String? penaltyReason,
    double? penaltyPoint,
    String? labelType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _penaltyReason = penaltyReason,
        _penaltyPoint = penaltyPoint,
        _labelType = labelType,
        super(firestoreUtilData);

  // "penaltyReason" field.
  String? _penaltyReason;
  String get penaltyReason => _penaltyReason ?? '';
  set penaltyReason(String? val) => _penaltyReason = val;

  bool hasPenaltyReason() => _penaltyReason != null;

  // "penaltyPoint" field.
  double? _penaltyPoint;
  double get penaltyPoint => _penaltyPoint ?? 0.0;
  set penaltyPoint(double? val) => _penaltyPoint = val;

  void incrementPenaltyPoint(double amount) =>
      penaltyPoint = penaltyPoint + amount;

  bool hasPenaltyPoint() => _penaltyPoint != null;

  // "labelType" field.
  String? _labelType;
  String get labelType => _labelType ?? '';
  set labelType(String? val) => _labelType = val;

  bool hasLabelType() => _labelType != null;

  static PenaltyInputEachStruct fromMap(Map<String, dynamic> data) =>
      PenaltyInputEachStruct(
        penaltyReason: data['penaltyReason'] as String?,
        penaltyPoint: castToType<double>(data['penaltyPoint']),
        labelType: data['labelType'] as String?,
      );

  static PenaltyInputEachStruct? maybeFromMap(dynamic data) => data is Map
      ? PenaltyInputEachStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'penaltyReason': _penaltyReason,
        'penaltyPoint': _penaltyPoint,
        'labelType': _labelType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'penaltyReason': serializeParam(
          _penaltyReason,
          ParamType.String,
        ),
        'penaltyPoint': serializeParam(
          _penaltyPoint,
          ParamType.double,
        ),
        'labelType': serializeParam(
          _labelType,
          ParamType.String,
        ),
      }.withoutNulls;

  static PenaltyInputEachStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PenaltyInputEachStruct(
        penaltyReason: deserializeParam(
          data['penaltyReason'],
          ParamType.String,
          false,
        ),
        penaltyPoint: deserializeParam(
          data['penaltyPoint'],
          ParamType.double,
          false,
        ),
        labelType: deserializeParam(
          data['labelType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PenaltyInputEachStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PenaltyInputEachStruct &&
        penaltyReason == other.penaltyReason &&
        penaltyPoint == other.penaltyPoint &&
        labelType == other.labelType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([penaltyReason, penaltyPoint, labelType]);
}

PenaltyInputEachStruct createPenaltyInputEachStruct({
  String? penaltyReason,
  double? penaltyPoint,
  String? labelType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PenaltyInputEachStruct(
      penaltyReason: penaltyReason,
      penaltyPoint: penaltyPoint,
      labelType: labelType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PenaltyInputEachStruct? updatePenaltyInputEachStruct(
  PenaltyInputEachStruct? penaltyInputEach, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    penaltyInputEach
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPenaltyInputEachStructData(
  Map<String, dynamic> firestoreData,
  PenaltyInputEachStruct? penaltyInputEach,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (penaltyInputEach == null) {
    return;
  }
  if (penaltyInputEach.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && penaltyInputEach.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final penaltyInputEachData =
      getPenaltyInputEachFirestoreData(penaltyInputEach, forFieldValue);
  final nestedData =
      penaltyInputEachData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = penaltyInputEach.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPenaltyInputEachFirestoreData(
  PenaltyInputEachStruct? penaltyInputEach, [
  bool forFieldValue = false,
]) {
  if (penaltyInputEach == null) {
    return {};
  }
  final firestoreData = mapToFirestore(penaltyInputEach.toMap());

  // Add any Firestore field values
  penaltyInputEach.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPenaltyInputEachListFirestoreData(
  List<PenaltyInputEachStruct>? penaltyInputEachs,
) =>
    penaltyInputEachs
        ?.map((e) => getPenaltyInputEachFirestoreData(e, true))
        .toList() ??
    [];
