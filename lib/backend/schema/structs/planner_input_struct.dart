// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlannerInputStruct extends FFFirebaseStruct {
  PlannerInputStruct({
    DateTime? studyDate,
    Color? pickedColor,
    String? subjectNamePlanner,
    String? whatIDid,
    List<DateTime>? studyStartTime,
    List<DateTime>? studyEndTime,
    List<bool>? inNaegong,
    String? isdone,
    bool? isRunning,
    List<String>? timeToAddSchema,
    List<String>? restinfo,
    bool? isFinish,
    bool? togglefinger,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _studyDate = studyDate,
        _pickedColor = pickedColor,
        _subjectNamePlanner = subjectNamePlanner,
        _whatIDid = whatIDid,
        _studyStartTime = studyStartTime,
        _studyEndTime = studyEndTime,
        _inNaegong = inNaegong,
        _isdone = isdone,
        _isRunning = isRunning,
        _timeToAddSchema = timeToAddSchema,
        _restinfo = restinfo,
        _isFinish = isFinish,
        _togglefinger = togglefinger,
        super(firestoreUtilData);

  // "studyDate" field.
  DateTime? _studyDate;
  DateTime? get studyDate => _studyDate;
  set studyDate(DateTime? val) => _studyDate = val;

  bool hasStudyDate() => _studyDate != null;

  // "pickedColor" field.
  Color? _pickedColor;
  Color? get pickedColor => _pickedColor;
  set pickedColor(Color? val) => _pickedColor = val;

  bool hasPickedColor() => _pickedColor != null;

  // "SubjectNamePlanner" field.
  String? _subjectNamePlanner;
  String get subjectNamePlanner => _subjectNamePlanner ?? '';
  set subjectNamePlanner(String? val) => _subjectNamePlanner = val;

  bool hasSubjectNamePlanner() => _subjectNamePlanner != null;

  // "WhatIDid" field.
  String? _whatIDid;
  String get whatIDid => _whatIDid ?? '';
  set whatIDid(String? val) => _whatIDid = val;

  bool hasWhatIDid() => _whatIDid != null;

  // "studyStartTime" field.
  List<DateTime>? _studyStartTime;
  List<DateTime> get studyStartTime => _studyStartTime ?? const [];
  set studyStartTime(List<DateTime>? val) => _studyStartTime = val;

  void updateStudyStartTime(Function(List<DateTime>) updateFn) {
    updateFn(_studyStartTime ??= []);
  }

  bool hasStudyStartTime() => _studyStartTime != null;

  // "studyEndTime" field.
  List<DateTime>? _studyEndTime;
  List<DateTime> get studyEndTime => _studyEndTime ?? const [];
  set studyEndTime(List<DateTime>? val) => _studyEndTime = val;

  void updateStudyEndTime(Function(List<DateTime>) updateFn) {
    updateFn(_studyEndTime ??= []);
  }

  bool hasStudyEndTime() => _studyEndTime != null;

  // "inNaegong" field.
  List<bool>? _inNaegong;
  List<bool> get inNaegong => _inNaegong ?? const [];
  set inNaegong(List<bool>? val) => _inNaegong = val;

  void updateInNaegong(Function(List<bool>) updateFn) {
    updateFn(_inNaegong ??= []);
  }

  bool hasInNaegong() => _inNaegong != null;

  // "isdone" field.
  String? _isdone;
  String get isdone => _isdone ?? 'unfinish';
  set isdone(String? val) => _isdone = val;

  bool hasIsdone() => _isdone != null;

  // "isRunning" field.
  bool? _isRunning;
  bool get isRunning => _isRunning ?? false;
  set isRunning(bool? val) => _isRunning = val;

  bool hasIsRunning() => _isRunning != null;

  // "timeToAddSchema" field.
  List<String>? _timeToAddSchema;
  List<String> get timeToAddSchema => _timeToAddSchema ?? const [];
  set timeToAddSchema(List<String>? val) => _timeToAddSchema = val;

  void updateTimeToAddSchema(Function(List<String>) updateFn) {
    updateFn(_timeToAddSchema ??= []);
  }

  bool hasTimeToAddSchema() => _timeToAddSchema != null;

  // "restinfo" field.
  List<String>? _restinfo;
  List<String> get restinfo => _restinfo ?? const [];
  set restinfo(List<String>? val) => _restinfo = val;

  void updateRestinfo(Function(List<String>) updateFn) {
    updateFn(_restinfo ??= []);
  }

  bool hasRestinfo() => _restinfo != null;

  // "isFinish" field.
  bool? _isFinish;
  bool get isFinish => _isFinish ?? false;
  set isFinish(bool? val) => _isFinish = val;

  bool hasIsFinish() => _isFinish != null;

  // "togglefinger" field.
  bool? _togglefinger;
  bool get togglefinger => _togglefinger ?? false;
  set togglefinger(bool? val) => _togglefinger = val;

  bool hasTogglefinger() => _togglefinger != null;

  static PlannerInputStruct fromMap(Map<String, dynamic> data) =>
      PlannerInputStruct(
        studyDate: data['studyDate'] as DateTime?,
        pickedColor: getSchemaColor(data['pickedColor']),
        subjectNamePlanner: data['SubjectNamePlanner'] as String?,
        whatIDid: data['WhatIDid'] as String?,
        studyStartTime: getDataList(data['studyStartTime']),
        studyEndTime: getDataList(data['studyEndTime']),
        inNaegong: getDataList(data['inNaegong']),
        isdone: data['isdone'] as String?,
        isRunning: data['isRunning'] as bool?,
        timeToAddSchema: getDataList(data['timeToAddSchema']),
        restinfo: getDataList(data['restinfo']),
        isFinish: data['isFinish'] as bool?,
        togglefinger: data['togglefinger'] as bool?,
      );

  static PlannerInputStruct? maybeFromMap(dynamic data) => data is Map
      ? PlannerInputStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'studyDate': _studyDate,
        'pickedColor': _pickedColor,
        'SubjectNamePlanner': _subjectNamePlanner,
        'WhatIDid': _whatIDid,
        'studyStartTime': _studyStartTime,
        'studyEndTime': _studyEndTime,
        'inNaegong': _inNaegong,
        'isdone': _isdone,
        'isRunning': _isRunning,
        'timeToAddSchema': _timeToAddSchema,
        'restinfo': _restinfo,
        'isFinish': _isFinish,
        'togglefinger': _togglefinger,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'studyDate': serializeParam(
          _studyDate,
          ParamType.DateTime,
        ),
        'pickedColor': serializeParam(
          _pickedColor,
          ParamType.Color,
        ),
        'SubjectNamePlanner': serializeParam(
          _subjectNamePlanner,
          ParamType.String,
        ),
        'WhatIDid': serializeParam(
          _whatIDid,
          ParamType.String,
        ),
        'studyStartTime': serializeParam(
          _studyStartTime,
          ParamType.DateTime,
          isList: true,
        ),
        'studyEndTime': serializeParam(
          _studyEndTime,
          ParamType.DateTime,
          isList: true,
        ),
        'inNaegong': serializeParam(
          _inNaegong,
          ParamType.bool,
          isList: true,
        ),
        'isdone': serializeParam(
          _isdone,
          ParamType.String,
        ),
        'isRunning': serializeParam(
          _isRunning,
          ParamType.bool,
        ),
        'timeToAddSchema': serializeParam(
          _timeToAddSchema,
          ParamType.String,
          isList: true,
        ),
        'restinfo': serializeParam(
          _restinfo,
          ParamType.String,
          isList: true,
        ),
        'isFinish': serializeParam(
          _isFinish,
          ParamType.bool,
        ),
        'togglefinger': serializeParam(
          _togglefinger,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PlannerInputStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlannerInputStruct(
        studyDate: deserializeParam(
          data['studyDate'],
          ParamType.DateTime,
          false,
        ),
        pickedColor: deserializeParam(
          data['pickedColor'],
          ParamType.Color,
          false,
        ),
        subjectNamePlanner: deserializeParam(
          data['SubjectNamePlanner'],
          ParamType.String,
          false,
        ),
        whatIDid: deserializeParam(
          data['WhatIDid'],
          ParamType.String,
          false,
        ),
        studyStartTime: deserializeParam<DateTime>(
          data['studyStartTime'],
          ParamType.DateTime,
          true,
        ),
        studyEndTime: deserializeParam<DateTime>(
          data['studyEndTime'],
          ParamType.DateTime,
          true,
        ),
        inNaegong: deserializeParam<bool>(
          data['inNaegong'],
          ParamType.bool,
          true,
        ),
        isdone: deserializeParam(
          data['isdone'],
          ParamType.String,
          false,
        ),
        isRunning: deserializeParam(
          data['isRunning'],
          ParamType.bool,
          false,
        ),
        timeToAddSchema: deserializeParam<String>(
          data['timeToAddSchema'],
          ParamType.String,
          true,
        ),
        restinfo: deserializeParam<String>(
          data['restinfo'],
          ParamType.String,
          true,
        ),
        isFinish: deserializeParam(
          data['isFinish'],
          ParamType.bool,
          false,
        ),
        togglefinger: deserializeParam(
          data['togglefinger'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PlannerInputStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlannerInputStruct &&
        studyDate == other.studyDate &&
        pickedColor == other.pickedColor &&
        subjectNamePlanner == other.subjectNamePlanner &&
        whatIDid == other.whatIDid &&
        listEquality.equals(studyStartTime, other.studyStartTime) &&
        listEquality.equals(studyEndTime, other.studyEndTime) &&
        listEquality.equals(inNaegong, other.inNaegong) &&
        isdone == other.isdone &&
        isRunning == other.isRunning &&
        listEquality.equals(timeToAddSchema, other.timeToAddSchema) &&
        listEquality.equals(restinfo, other.restinfo) &&
        isFinish == other.isFinish &&
        togglefinger == other.togglefinger;
  }

  @override
  int get hashCode => const ListEquality().hash([
        studyDate,
        pickedColor,
        subjectNamePlanner,
        whatIDid,
        studyStartTime,
        studyEndTime,
        inNaegong,
        isdone,
        isRunning,
        timeToAddSchema,
        restinfo,
        isFinish,
        togglefinger
      ]);
}

PlannerInputStruct createPlannerInputStruct({
  DateTime? studyDate,
  Color? pickedColor,
  String? subjectNamePlanner,
  String? whatIDid,
  String? isdone,
  bool? isRunning,
  bool? isFinish,
  bool? togglefinger,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlannerInputStruct(
      studyDate: studyDate,
      pickedColor: pickedColor,
      subjectNamePlanner: subjectNamePlanner,
      whatIDid: whatIDid,
      isdone: isdone,
      isRunning: isRunning,
      isFinish: isFinish,
      togglefinger: togglefinger,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlannerInputStruct? updatePlannerInputStruct(
  PlannerInputStruct? plannerInput, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plannerInput
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlannerInputStructData(
  Map<String, dynamic> firestoreData,
  PlannerInputStruct? plannerInput,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plannerInput == null) {
    return;
  }
  if (plannerInput.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && plannerInput.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final plannerInputData =
      getPlannerInputFirestoreData(plannerInput, forFieldValue);
  final nestedData =
      plannerInputData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = plannerInput.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlannerInputFirestoreData(
  PlannerInputStruct? plannerInput, [
  bool forFieldValue = false,
]) {
  if (plannerInput == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plannerInput.toMap());

  // Add any Firestore field values
  plannerInput.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlannerInputListFirestoreData(
  List<PlannerInputStruct>? plannerInputs,
) =>
    plannerInputs?.map((e) => getPlannerInputFirestoreData(e, true)).toList() ??
    [];
