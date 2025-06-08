// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpotAdminInfoStruct extends FFFirebaseStruct {
  SpotAdminInfoStruct({
    String? spot,
    String? sheetRoot,
    DocumentReference? references,
    List<SpotDailyDataStruct>? spotStudyEach,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _spot = spot,
        _sheetRoot = sheetRoot,
        _references = references,
        _spotStudyEach = spotStudyEach,
        super(firestoreUtilData);

  // "spot" field.
  String? _spot;
  String get spot => _spot ?? '';
  set spot(String? val) => _spot = val;

  bool hasSpot() => _spot != null;

  // "sheetRoot" field.
  String? _sheetRoot;
  String get sheetRoot => _sheetRoot ?? '';
  set sheetRoot(String? val) => _sheetRoot = val;

  bool hasSheetRoot() => _sheetRoot != null;

  // "references" field.
  DocumentReference? _references;
  DocumentReference? get references => _references;
  set references(DocumentReference? val) => _references = val;

  bool hasReferences() => _references != null;

  // "spotStudyEach" field.
  List<SpotDailyDataStruct>? _spotStudyEach;
  List<SpotDailyDataStruct> get spotStudyEach => _spotStudyEach ?? const [];
  set spotStudyEach(List<SpotDailyDataStruct>? val) => _spotStudyEach = val;

  void updateSpotStudyEach(Function(List<SpotDailyDataStruct>) updateFn) {
    updateFn(_spotStudyEach ??= []);
  }

  bool hasSpotStudyEach() => _spotStudyEach != null;

  static SpotAdminInfoStruct fromMap(Map<String, dynamic> data) =>
      SpotAdminInfoStruct(
        spot: data['spot'] as String?,
        sheetRoot: data['sheetRoot'] as String?,
        references: data['references'] as DocumentReference?,
        spotStudyEach: getStructList(
          data['spotStudyEach'],
          SpotDailyDataStruct.fromMap,
        ),
      );

  static SpotAdminInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? SpotAdminInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'spot': _spot,
        'sheetRoot': _sheetRoot,
        'references': _references,
        'spotStudyEach': _spotStudyEach?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'spot': serializeParam(
          _spot,
          ParamType.String,
        ),
        'sheetRoot': serializeParam(
          _sheetRoot,
          ParamType.String,
        ),
        'references': serializeParam(
          _references,
          ParamType.DocumentReference,
        ),
        'spotStudyEach': serializeParam(
          _spotStudyEach,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SpotAdminInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpotAdminInfoStruct(
        spot: deserializeParam(
          data['spot'],
          ParamType.String,
          false,
        ),
        sheetRoot: deserializeParam(
          data['sheetRoot'],
          ParamType.String,
          false,
        ),
        references: deserializeParam(
          data['references'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        spotStudyEach: deserializeStructParam<SpotDailyDataStruct>(
          data['spotStudyEach'],
          ParamType.DataStruct,
          true,
          structBuilder: SpotDailyDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SpotAdminInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SpotAdminInfoStruct &&
        spot == other.spot &&
        sheetRoot == other.sheetRoot &&
        references == other.references &&
        listEquality.equals(spotStudyEach, other.spotStudyEach);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([spot, sheetRoot, references, spotStudyEach]);
}

SpotAdminInfoStruct createSpotAdminInfoStruct({
  String? spot,
  String? sheetRoot,
  DocumentReference? references,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpotAdminInfoStruct(
      spot: spot,
      sheetRoot: sheetRoot,
      references: references,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpotAdminInfoStruct? updateSpotAdminInfoStruct(
  SpotAdminInfoStruct? spotAdminInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spotAdminInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpotAdminInfoStructData(
  Map<String, dynamic> firestoreData,
  SpotAdminInfoStruct? spotAdminInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spotAdminInfo == null) {
    return;
  }
  if (spotAdminInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spotAdminInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spotAdminInfoData =
      getSpotAdminInfoFirestoreData(spotAdminInfo, forFieldValue);
  final nestedData =
      spotAdminInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spotAdminInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpotAdminInfoFirestoreData(
  SpotAdminInfoStruct? spotAdminInfo, [
  bool forFieldValue = false,
]) {
  if (spotAdminInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spotAdminInfo.toMap());

  // Add any Firestore field values
  spotAdminInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpotAdminInfoListFirestoreData(
  List<SpotAdminInfoStruct>? spotAdminInfos,
) =>
    spotAdminInfos
        ?.map((e) => getSpotAdminInfoFirestoreData(e, true))
        .toList() ??
    [];
