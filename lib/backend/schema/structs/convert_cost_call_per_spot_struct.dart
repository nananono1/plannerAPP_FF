// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConvertCostCallPerSpotStruct extends FFFirebaseStruct {
  ConvertCostCallPerSpotStruct({
    String? date,
    String? totalActiveUser,
    List<int>? activeSeats,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _totalActiveUser = totalActiveUser,
        _activeSeats = activeSeats,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "totalActiveUser" field.
  String? _totalActiveUser;
  String get totalActiveUser => _totalActiveUser ?? '';
  set totalActiveUser(String? val) => _totalActiveUser = val;

  bool hasTotalActiveUser() => _totalActiveUser != null;

  // "activeSeats" field.
  List<int>? _activeSeats;
  List<int> get activeSeats => _activeSeats ?? const [];
  set activeSeats(List<int>? val) => _activeSeats = val;

  void updateActiveSeats(Function(List<int>) updateFn) {
    updateFn(_activeSeats ??= []);
  }

  bool hasActiveSeats() => _activeSeats != null;

  static ConvertCostCallPerSpotStruct fromMap(Map<String, dynamic> data) =>
      ConvertCostCallPerSpotStruct(
        date: data['date'] as String?,
        totalActiveUser: data['totalActiveUser'] as String?,
        activeSeats: getDataList(data['activeSeats']),
      );

  static ConvertCostCallPerSpotStruct? maybeFromMap(dynamic data) => data is Map
      ? ConvertCostCallPerSpotStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'totalActiveUser': _totalActiveUser,
        'activeSeats': _activeSeats,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'totalActiveUser': serializeParam(
          _totalActiveUser,
          ParamType.String,
        ),
        'activeSeats': serializeParam(
          _activeSeats,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static ConvertCostCallPerSpotStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConvertCostCallPerSpotStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        totalActiveUser: deserializeParam(
          data['totalActiveUser'],
          ParamType.String,
          false,
        ),
        activeSeats: deserializeParam<int>(
          data['activeSeats'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'ConvertCostCallPerSpotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConvertCostCallPerSpotStruct &&
        date == other.date &&
        totalActiveUser == other.totalActiveUser &&
        listEquality.equals(activeSeats, other.activeSeats);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, totalActiveUser, activeSeats]);
}

ConvertCostCallPerSpotStruct createConvertCostCallPerSpotStruct({
  String? date,
  String? totalActiveUser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConvertCostCallPerSpotStruct(
      date: date,
      totalActiveUser: totalActiveUser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConvertCostCallPerSpotStruct? updateConvertCostCallPerSpotStruct(
  ConvertCostCallPerSpotStruct? convertCostCallPerSpot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    convertCostCallPerSpot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConvertCostCallPerSpotStructData(
  Map<String, dynamic> firestoreData,
  ConvertCostCallPerSpotStruct? convertCostCallPerSpot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (convertCostCallPerSpot == null) {
    return;
  }
  if (convertCostCallPerSpot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      convertCostCallPerSpot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final convertCostCallPerSpotData = getConvertCostCallPerSpotFirestoreData(
      convertCostCallPerSpot, forFieldValue);
  final nestedData =
      convertCostCallPerSpotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      convertCostCallPerSpot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConvertCostCallPerSpotFirestoreData(
  ConvertCostCallPerSpotStruct? convertCostCallPerSpot, [
  bool forFieldValue = false,
]) {
  if (convertCostCallPerSpot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(convertCostCallPerSpot.toMap());

  // Add any Firestore field values
  convertCostCallPerSpot.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConvertCostCallPerSpotListFirestoreData(
  List<ConvertCostCallPerSpotStruct>? convertCostCallPerSpots,
) =>
    convertCostCallPerSpots
        ?.map((e) => getConvertCostCallPerSpotFirestoreData(e, true))
        .toList() ??
    [];
