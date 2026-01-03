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
    String? spotPassword,
    int? companyId,
    String? spotid,
    String? chatLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _spot = spot,
        _sheetRoot = sheetRoot,
        _references = references,
        _spotStudyEach = spotStudyEach,
        _spotPassword = spotPassword,
        _companyId = companyId,
        _spotid = spotid,
        _chatLink = chatLink,
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

  // "spotPassword" field.
  String? _spotPassword;
  String get spotPassword => _spotPassword ?? '';
  set spotPassword(String? val) => _spotPassword = val;

  bool hasSpotPassword() => _spotPassword != null;

  // "companyId" field.
  int? _companyId;
  int get companyId => _companyId ?? 0;
  set companyId(int? val) => _companyId = val;

  void incrementCompanyId(int amount) => companyId = companyId + amount;

  bool hasCompanyId() => _companyId != null;

  // "spotid" field.
  String? _spotid;
  String get spotid => _spotid ?? '';
  set spotid(String? val) => _spotid = val;

  bool hasSpotid() => _spotid != null;

  // "ChatLink" field.
  String? _chatLink;
  String get chatLink => _chatLink ?? '';
  set chatLink(String? val) => _chatLink = val;

  bool hasChatLink() => _chatLink != null;

  static SpotAdminInfoStruct fromMap(Map<String, dynamic> data) =>
      SpotAdminInfoStruct(
        spot: data['spot'] as String?,
        sheetRoot: data['sheetRoot'] as String?,
        references: data['references'] as DocumentReference?,
        spotStudyEach: getStructList(
          data['spotStudyEach'],
          SpotDailyDataStruct.fromMap,
        ),
        spotPassword: data['spotPassword'] as String?,
        companyId: castToType<int>(data['companyId']),
        spotid: data['spotid'] as String?,
        chatLink: data['ChatLink'] as String?,
      );

  static SpotAdminInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? SpotAdminInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'spot': _spot,
        'sheetRoot': _sheetRoot,
        'references': _references,
        'spotStudyEach': _spotStudyEach?.map((e) => e.toMap()).toList(),
        'spotPassword': _spotPassword,
        'companyId': _companyId,
        'spotid': _spotid,
        'ChatLink': _chatLink,
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
        'spotPassword': serializeParam(
          _spotPassword,
          ParamType.String,
        ),
        'companyId': serializeParam(
          _companyId,
          ParamType.int,
        ),
        'spotid': serializeParam(
          _spotid,
          ParamType.String,
        ),
        'ChatLink': serializeParam(
          _chatLink,
          ParamType.String,
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
        spotPassword: deserializeParam(
          data['spotPassword'],
          ParamType.String,
          false,
        ),
        companyId: deserializeParam(
          data['companyId'],
          ParamType.int,
          false,
        ),
        spotid: deserializeParam(
          data['spotid'],
          ParamType.String,
          false,
        ),
        chatLink: deserializeParam(
          data['ChatLink'],
          ParamType.String,
          false,
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
        listEquality.equals(spotStudyEach, other.spotStudyEach) &&
        spotPassword == other.spotPassword &&
        companyId == other.companyId &&
        spotid == other.spotid &&
        chatLink == other.chatLink;
  }

  @override
  int get hashCode => const ListEquality().hash([
        spot,
        sheetRoot,
        references,
        spotStudyEach,
        spotPassword,
        companyId,
        spotid,
        chatLink
      ]);
}

SpotAdminInfoStruct createSpotAdminInfoStruct({
  String? spot,
  String? sheetRoot,
  DocumentReference? references,
  String? spotPassword,
  int? companyId,
  String? spotid,
  String? chatLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpotAdminInfoStruct(
      spot: spot,
      sheetRoot: sheetRoot,
      references: references,
      spotPassword: spotPassword,
      companyId: companyId,
      spotid: spotid,
      chatLink: chatLink,
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
