// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageStateSchemaStruct extends FFFirebaseStruct {
  PageStateSchemaStruct({
    List<PlannerInputStruct>? inputListState,
    DateTime? submittedDatePlanner,
    String? goodThingsPlanner,
    String? imporovementState,
    double? archivePercentState,
    String? teacherquoteState,
    bool? isSubmittedPara,
    String? userName,
    bool? adminCheckedPara,
    DailyStartingStruct? dailyStartPara,
    BasicUserInfoStruct? basicInfoState,
    int? timetableStartIndex,
    int? timetableEndIndex,
    String? docID,
    int? pointget,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _inputListState = inputListState,
        _submittedDatePlanner = submittedDatePlanner,
        _goodThingsPlanner = goodThingsPlanner,
        _imporovementState = imporovementState,
        _archivePercentState = archivePercentState,
        _teacherquoteState = teacherquoteState,
        _isSubmittedPara = isSubmittedPara,
        _userName = userName,
        _adminCheckedPara = adminCheckedPara,
        _dailyStartPara = dailyStartPara,
        _basicInfoState = basicInfoState,
        _timetableStartIndex = timetableStartIndex,
        _timetableEndIndex = timetableEndIndex,
        _docID = docID,
        _pointget = pointget,
        super(firestoreUtilData);

  // "inputListState" field.
  List<PlannerInputStruct>? _inputListState;
  List<PlannerInputStruct> get inputListState => _inputListState ?? const [];
  set inputListState(List<PlannerInputStruct>? val) => _inputListState = val;

  void updateInputListState(Function(List<PlannerInputStruct>) updateFn) {
    updateFn(_inputListState ??= []);
  }

  bool hasInputListState() => _inputListState != null;

  // "submittedDatePlanner" field.
  DateTime? _submittedDatePlanner;
  DateTime? get submittedDatePlanner => _submittedDatePlanner;
  set submittedDatePlanner(DateTime? val) => _submittedDatePlanner = val;

  bool hasSubmittedDatePlanner() => _submittedDatePlanner != null;

  // "goodThingsPlanner" field.
  String? _goodThingsPlanner;
  String get goodThingsPlanner => _goodThingsPlanner ?? '';
  set goodThingsPlanner(String? val) => _goodThingsPlanner = val;

  bool hasGoodThingsPlanner() => _goodThingsPlanner != null;

  // "imporovementState" field.
  String? _imporovementState;
  String get imporovementState => _imporovementState ?? '';
  set imporovementState(String? val) => _imporovementState = val;

  bool hasImporovementState() => _imporovementState != null;

  // "archivePercentState" field.
  double? _archivePercentState;
  double get archivePercentState => _archivePercentState ?? 0.0;
  set archivePercentState(double? val) => _archivePercentState = val;

  void incrementArchivePercentState(double amount) =>
      archivePercentState = archivePercentState + amount;

  bool hasArchivePercentState() => _archivePercentState != null;

  // "teacherquoteState" field.
  String? _teacherquoteState;
  String get teacherquoteState => _teacherquoteState ?? '';
  set teacherquoteState(String? val) => _teacherquoteState = val;

  bool hasTeacherquoteState() => _teacherquoteState != null;

  // "isSubmittedPara" field.
  bool? _isSubmittedPara;
  bool get isSubmittedPara => _isSubmittedPara ?? false;
  set isSubmittedPara(bool? val) => _isSubmittedPara = val;

  bool hasIsSubmittedPara() => _isSubmittedPara != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "adminCheckedPara" field.
  bool? _adminCheckedPara;
  bool get adminCheckedPara => _adminCheckedPara ?? false;
  set adminCheckedPara(bool? val) => _adminCheckedPara = val;

  bool hasAdminCheckedPara() => _adminCheckedPara != null;

  // "dailyStartPara" field.
  DailyStartingStruct? _dailyStartPara;
  DailyStartingStruct get dailyStartPara =>
      _dailyStartPara ?? DailyStartingStruct();
  set dailyStartPara(DailyStartingStruct? val) => _dailyStartPara = val;

  void updateDailyStartPara(Function(DailyStartingStruct) updateFn) {
    updateFn(_dailyStartPara ??= DailyStartingStruct());
  }

  bool hasDailyStartPara() => _dailyStartPara != null;

  // "basicInfoState" field.
  BasicUserInfoStruct? _basicInfoState;
  BasicUserInfoStruct get basicInfoState =>
      _basicInfoState ?? BasicUserInfoStruct();
  set basicInfoState(BasicUserInfoStruct? val) => _basicInfoState = val;

  void updateBasicInfoState(Function(BasicUserInfoStruct) updateFn) {
    updateFn(_basicInfoState ??= BasicUserInfoStruct());
  }

  bool hasBasicInfoState() => _basicInfoState != null;

  // "timetableStartIndex" field.
  int? _timetableStartIndex;
  int get timetableStartIndex => _timetableStartIndex ?? 0;
  set timetableStartIndex(int? val) => _timetableStartIndex = val;

  void incrementTimetableStartIndex(int amount) =>
      timetableStartIndex = timetableStartIndex + amount;

  bool hasTimetableStartIndex() => _timetableStartIndex != null;

  // "timetableEndIndex" field.
  int? _timetableEndIndex;
  int get timetableEndIndex => _timetableEndIndex ?? 0;
  set timetableEndIndex(int? val) => _timetableEndIndex = val;

  void incrementTimetableEndIndex(int amount) =>
      timetableEndIndex = timetableEndIndex + amount;

  bool hasTimetableEndIndex() => _timetableEndIndex != null;

  // "docID" field.
  String? _docID;
  String get docID => _docID ?? '';
  set docID(String? val) => _docID = val;

  bool hasDocID() => _docID != null;

  // "pointget" field.
  int? _pointget;
  int get pointget => _pointget ?? 0;
  set pointget(int? val) => _pointget = val;

  void incrementPointget(int amount) => pointget = pointget + amount;

  bool hasPointget() => _pointget != null;

  static PageStateSchemaStruct fromMap(Map<String, dynamic> data) =>
      PageStateSchemaStruct(
        inputListState: getStructList(
          data['inputListState'],
          PlannerInputStruct.fromMap,
        ),
        submittedDatePlanner: data['submittedDatePlanner'] as DateTime?,
        goodThingsPlanner: data['goodThingsPlanner'] as String?,
        imporovementState: data['imporovementState'] as String?,
        archivePercentState: castToType<double>(data['archivePercentState']),
        teacherquoteState: data['teacherquoteState'] as String?,
        isSubmittedPara: data['isSubmittedPara'] as bool?,
        userName: data['userName'] as String?,
        adminCheckedPara: data['adminCheckedPara'] as bool?,
        dailyStartPara: data['dailyStartPara'] is DailyStartingStruct
            ? data['dailyStartPara']
            : DailyStartingStruct.maybeFromMap(data['dailyStartPara']),
        basicInfoState: data['basicInfoState'] is BasicUserInfoStruct
            ? data['basicInfoState']
            : BasicUserInfoStruct.maybeFromMap(data['basicInfoState']),
        timetableStartIndex: castToType<int>(data['timetableStartIndex']),
        timetableEndIndex: castToType<int>(data['timetableEndIndex']),
        docID: data['docID'] as String?,
        pointget: castToType<int>(data['pointget']),
      );

  static PageStateSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? PageStateSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'inputListState': _inputListState?.map((e) => e.toMap()).toList(),
        'submittedDatePlanner': _submittedDatePlanner,
        'goodThingsPlanner': _goodThingsPlanner,
        'imporovementState': _imporovementState,
        'archivePercentState': _archivePercentState,
        'teacherquoteState': _teacherquoteState,
        'isSubmittedPara': _isSubmittedPara,
        'userName': _userName,
        'adminCheckedPara': _adminCheckedPara,
        'dailyStartPara': _dailyStartPara?.toMap(),
        'basicInfoState': _basicInfoState?.toMap(),
        'timetableStartIndex': _timetableStartIndex,
        'timetableEndIndex': _timetableEndIndex,
        'docID': _docID,
        'pointget': _pointget,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'inputListState': serializeParam(
          _inputListState,
          ParamType.DataStruct,
          isList: true,
        ),
        'submittedDatePlanner': serializeParam(
          _submittedDatePlanner,
          ParamType.DateTime,
        ),
        'goodThingsPlanner': serializeParam(
          _goodThingsPlanner,
          ParamType.String,
        ),
        'imporovementState': serializeParam(
          _imporovementState,
          ParamType.String,
        ),
        'archivePercentState': serializeParam(
          _archivePercentState,
          ParamType.double,
        ),
        'teacherquoteState': serializeParam(
          _teacherquoteState,
          ParamType.String,
        ),
        'isSubmittedPara': serializeParam(
          _isSubmittedPara,
          ParamType.bool,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'adminCheckedPara': serializeParam(
          _adminCheckedPara,
          ParamType.bool,
        ),
        'dailyStartPara': serializeParam(
          _dailyStartPara,
          ParamType.DataStruct,
        ),
        'basicInfoState': serializeParam(
          _basicInfoState,
          ParamType.DataStruct,
        ),
        'timetableStartIndex': serializeParam(
          _timetableStartIndex,
          ParamType.int,
        ),
        'timetableEndIndex': serializeParam(
          _timetableEndIndex,
          ParamType.int,
        ),
        'docID': serializeParam(
          _docID,
          ParamType.String,
        ),
        'pointget': serializeParam(
          _pointget,
          ParamType.int,
        ),
      }.withoutNulls;

  static PageStateSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageStateSchemaStruct(
        inputListState: deserializeStructParam<PlannerInputStruct>(
          data['inputListState'],
          ParamType.DataStruct,
          true,
          structBuilder: PlannerInputStruct.fromSerializableMap,
        ),
        submittedDatePlanner: deserializeParam(
          data['submittedDatePlanner'],
          ParamType.DateTime,
          false,
        ),
        goodThingsPlanner: deserializeParam(
          data['goodThingsPlanner'],
          ParamType.String,
          false,
        ),
        imporovementState: deserializeParam(
          data['imporovementState'],
          ParamType.String,
          false,
        ),
        archivePercentState: deserializeParam(
          data['archivePercentState'],
          ParamType.double,
          false,
        ),
        teacherquoteState: deserializeParam(
          data['teacherquoteState'],
          ParamType.String,
          false,
        ),
        isSubmittedPara: deserializeParam(
          data['isSubmittedPara'],
          ParamType.bool,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        adminCheckedPara: deserializeParam(
          data['adminCheckedPara'],
          ParamType.bool,
          false,
        ),
        dailyStartPara: deserializeStructParam(
          data['dailyStartPara'],
          ParamType.DataStruct,
          false,
          structBuilder: DailyStartingStruct.fromSerializableMap,
        ),
        basicInfoState: deserializeStructParam(
          data['basicInfoState'],
          ParamType.DataStruct,
          false,
          structBuilder: BasicUserInfoStruct.fromSerializableMap,
        ),
        timetableStartIndex: deserializeParam(
          data['timetableStartIndex'],
          ParamType.int,
          false,
        ),
        timetableEndIndex: deserializeParam(
          data['timetableEndIndex'],
          ParamType.int,
          false,
        ),
        docID: deserializeParam(
          data['docID'],
          ParamType.String,
          false,
        ),
        pointget: deserializeParam(
          data['pointget'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PageStateSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PageStateSchemaStruct &&
        listEquality.equals(inputListState, other.inputListState) &&
        submittedDatePlanner == other.submittedDatePlanner &&
        goodThingsPlanner == other.goodThingsPlanner &&
        imporovementState == other.imporovementState &&
        archivePercentState == other.archivePercentState &&
        teacherquoteState == other.teacherquoteState &&
        isSubmittedPara == other.isSubmittedPara &&
        userName == other.userName &&
        adminCheckedPara == other.adminCheckedPara &&
        dailyStartPara == other.dailyStartPara &&
        basicInfoState == other.basicInfoState &&
        timetableStartIndex == other.timetableStartIndex &&
        timetableEndIndex == other.timetableEndIndex &&
        docID == other.docID &&
        pointget == other.pointget;
  }

  @override
  int get hashCode => const ListEquality().hash([
        inputListState,
        submittedDatePlanner,
        goodThingsPlanner,
        imporovementState,
        archivePercentState,
        teacherquoteState,
        isSubmittedPara,
        userName,
        adminCheckedPara,
        dailyStartPara,
        basicInfoState,
        timetableStartIndex,
        timetableEndIndex,
        docID,
        pointget
      ]);
}

PageStateSchemaStruct createPageStateSchemaStruct({
  DateTime? submittedDatePlanner,
  String? goodThingsPlanner,
  String? imporovementState,
  double? archivePercentState,
  String? teacherquoteState,
  bool? isSubmittedPara,
  String? userName,
  bool? adminCheckedPara,
  DailyStartingStruct? dailyStartPara,
  BasicUserInfoStruct? basicInfoState,
  int? timetableStartIndex,
  int? timetableEndIndex,
  String? docID,
  int? pointget,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageStateSchemaStruct(
      submittedDatePlanner: submittedDatePlanner,
      goodThingsPlanner: goodThingsPlanner,
      imporovementState: imporovementState,
      archivePercentState: archivePercentState,
      teacherquoteState: teacherquoteState,
      isSubmittedPara: isSubmittedPara,
      userName: userName,
      adminCheckedPara: adminCheckedPara,
      dailyStartPara:
          dailyStartPara ?? (clearUnsetFields ? DailyStartingStruct() : null),
      basicInfoState:
          basicInfoState ?? (clearUnsetFields ? BasicUserInfoStruct() : null),
      timetableStartIndex: timetableStartIndex,
      timetableEndIndex: timetableEndIndex,
      docID: docID,
      pointget: pointget,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageStateSchemaStruct? updatePageStateSchemaStruct(
  PageStateSchemaStruct? pageStateSchema, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageStateSchema
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageStateSchemaStructData(
  Map<String, dynamic> firestoreData,
  PageStateSchemaStruct? pageStateSchema,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageStateSchema == null) {
    return;
  }
  if (pageStateSchema.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageStateSchema.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageStateSchemaData =
      getPageStateSchemaFirestoreData(pageStateSchema, forFieldValue);
  final nestedData =
      pageStateSchemaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageStateSchema.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageStateSchemaFirestoreData(
  PageStateSchemaStruct? pageStateSchema, [
  bool forFieldValue = false,
]) {
  if (pageStateSchema == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageStateSchema.toMap());

  // Handle nested data for "dailyStartPara" field.
  addDailyStartingStructData(
    firestoreData,
    pageStateSchema.hasDailyStartPara() ? pageStateSchema.dailyStartPara : null,
    'dailyStartPara',
    forFieldValue,
  );

  // Handle nested data for "basicInfoState" field.
  addBasicUserInfoStructData(
    firestoreData,
    pageStateSchema.hasBasicInfoState() ? pageStateSchema.basicInfoState : null,
    'basicInfoState',
    forFieldValue,
  );

  // Add any Firestore field values
  pageStateSchema.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageStateSchemaListFirestoreData(
  List<PageStateSchemaStruct>? pageStateSchemas,
) =>
    pageStateSchemas
        ?.map((e) => getPageStateSchemaFirestoreData(e, true))
        .toList() ??
    [];
