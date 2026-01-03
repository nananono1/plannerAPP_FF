// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PenaltyInputStruct extends FFFirebaseStruct {
  PenaltyInputStruct({
    String? label,
    String? reasonWhy,
    double? penaltygiven,
    DateTime? getDate,
    bool? hascancelled,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _reasonWhy = reasonWhy,
        _penaltygiven = penaltygiven,
        _getDate = getDate,
        _hascancelled = hascancelled,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "reasonWhy" field.
  String? _reasonWhy;
  String get reasonWhy => _reasonWhy ?? '관리자 판단하 상점부여';
  set reasonWhy(String? val) => _reasonWhy = val;

  bool hasReasonWhy() => _reasonWhy != null;

  // "penaltygiven" field.
  double? _penaltygiven;
  double get penaltygiven => _penaltygiven ?? 0.0;
  set penaltygiven(double? val) => _penaltygiven = val;

  void incrementPenaltygiven(double amount) =>
      penaltygiven = penaltygiven + amount;

  bool hasPenaltygiven() => _penaltygiven != null;

  // "getDate" field.
  DateTime? _getDate;
  DateTime get getDate =>
      _getDate ?? DateTime.fromMicrosecondsSinceEpoch(1735657200000000);
  set getDate(DateTime? val) => _getDate = val;

  bool hasGetDate() => _getDate != null;

  // "hascancelled" field.
  bool? _hascancelled;
  bool get hascancelled => _hascancelled ?? false;
  set hascancelled(bool? val) => _hascancelled = val;

  bool hasHascancelled() => _hascancelled != null;

  static PenaltyInputStruct fromMap(Map<String, dynamic> data) =>
      PenaltyInputStruct(
        label: data['label'] as String?,
        reasonWhy: data['reasonWhy'] as String?,
        penaltygiven: castToType<double>(data['penaltygiven']),
        getDate: data['getDate'] as DateTime?,
        hascancelled: data['hascancelled'] as bool?,
      );

  static PenaltyInputStruct? maybeFromMap(dynamic data) => data is Map
      ? PenaltyInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'reasonWhy': _reasonWhy,
        'penaltygiven': _penaltygiven,
        'getDate': _getDate,
        'hascancelled': _hascancelled,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'reasonWhy': serializeParam(
          _reasonWhy,
          ParamType.String,
        ),
        'penaltygiven': serializeParam(
          _penaltygiven,
          ParamType.double,
        ),
        'getDate': serializeParam(
          _getDate,
          ParamType.DateTime,
        ),
        'hascancelled': serializeParam(
          _hascancelled,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PenaltyInputStruct fromSerializableMap(Map<String, dynamic> data) =>
      PenaltyInputStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        reasonWhy: deserializeParam(
          data['reasonWhy'],
          ParamType.String,
          false,
        ),
        penaltygiven: deserializeParam(
          data['penaltygiven'],
          ParamType.double,
          false,
        ),
        getDate: deserializeParam(
          data['getDate'],
          ParamType.DateTime,
          false,
        ),
        hascancelled: deserializeParam(
          data['hascancelled'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PenaltyInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PenaltyInputStruct &&
        label == other.label &&
        reasonWhy == other.reasonWhy &&
        penaltygiven == other.penaltygiven &&
        getDate == other.getDate &&
        hascancelled == other.hascancelled;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([label, reasonWhy, penaltygiven, getDate, hascancelled]);
}

PenaltyInputStruct createPenaltyInputStruct({
  String? label,
  String? reasonWhy,
  double? penaltygiven,
  DateTime? getDate,
  bool? hascancelled,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PenaltyInputStruct(
      label: label,
      reasonWhy: reasonWhy,
      penaltygiven: penaltygiven,
      getDate: getDate,
      hascancelled: hascancelled,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PenaltyInputStruct? updatePenaltyInputStruct(
  PenaltyInputStruct? penaltyInput, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    penaltyInput
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPenaltyInputStructData(
  Map<String, dynamic> firestoreData,
  PenaltyInputStruct? penaltyInput,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (penaltyInput == null) {
    return;
  }
  if (penaltyInput.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && penaltyInput.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final penaltyInputData =
      getPenaltyInputFirestoreData(penaltyInput, forFieldValue);
  final nestedData =
      penaltyInputData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = penaltyInput.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPenaltyInputFirestoreData(
  PenaltyInputStruct? penaltyInput, [
  bool forFieldValue = false,
]) {
  if (penaltyInput == null) {
    return {};
  }
  final firestoreData = mapToFirestore(penaltyInput.toMap());

  // Add any Firestore field values
  penaltyInput.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPenaltyInputListFirestoreData(
  List<PenaltyInputStruct>? penaltyInputs,
) =>
    penaltyInputs?.map((e) => getPenaltyInputFirestoreData(e, true)).toList() ??
    [];
