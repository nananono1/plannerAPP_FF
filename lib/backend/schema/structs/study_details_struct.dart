// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyDetailsStruct extends FFFirebaseStruct {
  StudyDetailsStruct({
    String? forwhat,
    String? forwhatDetail,
    bool? needConsulting,
    bool? needPlannerCoaching,
    String? signname1,
    String? signname2,
    String? signature1,
    String? signature2,
    String? signManager,
    DateTime? signTime,
    String? firstDate,
    GradeInfoStruct? gradeinfo1,
    GradeInfoStruct? gradeinfo2,
    GradeInfoStruct? gradeinfo3,
    GradeInfoStruct? gradeinfo4,
    GradeInfoStruct? gradeinfo5,
    GradeInfoStruct? gradeinfo6,
    String? signature3,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _forwhat = forwhat,
        _forwhatDetail = forwhatDetail,
        _needConsulting = needConsulting,
        _needPlannerCoaching = needPlannerCoaching,
        _signname1 = signname1,
        _signname2 = signname2,
        _signature1 = signature1,
        _signature2 = signature2,
        _signManager = signManager,
        _signTime = signTime,
        _firstDate = firstDate,
        _gradeinfo1 = gradeinfo1,
        _gradeinfo2 = gradeinfo2,
        _gradeinfo3 = gradeinfo3,
        _gradeinfo4 = gradeinfo4,
        _gradeinfo5 = gradeinfo5,
        _gradeinfo6 = gradeinfo6,
        _signature3 = signature3,
        super(firestoreUtilData);

  // "forwhat" field.
  String? _forwhat;
  String get forwhat => _forwhat ?? ' ';
  set forwhat(String? val) => _forwhat = val;

  bool hasForwhat() => _forwhat != null;

  // "forwhatDetail" field.
  String? _forwhatDetail;
  String get forwhatDetail => _forwhatDetail ?? ' ';
  set forwhatDetail(String? val) => _forwhatDetail = val;

  bool hasForwhatDetail() => _forwhatDetail != null;

  // "needConsulting" field.
  bool? _needConsulting;
  bool get needConsulting => _needConsulting ?? false;
  set needConsulting(bool? val) => _needConsulting = val;

  bool hasNeedConsulting() => _needConsulting != null;

  // "needPlannerCoaching" field.
  bool? _needPlannerCoaching;
  bool get needPlannerCoaching => _needPlannerCoaching ?? false;
  set needPlannerCoaching(bool? val) => _needPlannerCoaching = val;

  bool hasNeedPlannerCoaching() => _needPlannerCoaching != null;

  // "signname1" field.
  String? _signname1;
  String get signname1 => _signname1 ?? ' ';
  set signname1(String? val) => _signname1 = val;

  bool hasSignname1() => _signname1 != null;

  // "signname2" field.
  String? _signname2;
  String get signname2 => _signname2 ?? ' ';
  set signname2(String? val) => _signname2 = val;

  bool hasSignname2() => _signname2 != null;

  // "signature1" field.
  String? _signature1;
  String get signature1 => _signature1 ?? '';
  set signature1(String? val) => _signature1 = val;

  bool hasSignature1() => _signature1 != null;

  // "signature2" field.
  String? _signature2;
  String get signature2 => _signature2 ?? '';
  set signature2(String? val) => _signature2 = val;

  bool hasSignature2() => _signature2 != null;

  // "signManager" field.
  String? _signManager;
  String get signManager => _signManager ?? ' ';
  set signManager(String? val) => _signManager = val;

  bool hasSignManager() => _signManager != null;

  // "signTime" field.
  DateTime? _signTime;
  DateTime get signTime =>
      _signTime ?? DateTime.fromMicrosecondsSinceEpoch(1746025200000000);
  set signTime(DateTime? val) => _signTime = val;

  bool hasSignTime() => _signTime != null;

  // "firstDate" field.
  String? _firstDate;
  String get firstDate => _firstDate ?? ' ';
  set firstDate(String? val) => _firstDate = val;

  bool hasFirstDate() => _firstDate != null;

  // "gradeinfo1" field.
  GradeInfoStruct? _gradeinfo1;
  GradeInfoStruct get gradeinfo1 => _gradeinfo1 ?? GradeInfoStruct();
  set gradeinfo1(GradeInfoStruct? val) => _gradeinfo1 = val;

  void updateGradeinfo1(Function(GradeInfoStruct) updateFn) {
    updateFn(_gradeinfo1 ??= GradeInfoStruct());
  }

  bool hasGradeinfo1() => _gradeinfo1 != null;

  // "gradeinfo2" field.
  GradeInfoStruct? _gradeinfo2;
  GradeInfoStruct get gradeinfo2 => _gradeinfo2 ?? GradeInfoStruct();
  set gradeinfo2(GradeInfoStruct? val) => _gradeinfo2 = val;

  void updateGradeinfo2(Function(GradeInfoStruct) updateFn) {
    updateFn(_gradeinfo2 ??= GradeInfoStruct());
  }

  bool hasGradeinfo2() => _gradeinfo2 != null;

  // "gradeinfo3" field.
  GradeInfoStruct? _gradeinfo3;
  GradeInfoStruct get gradeinfo3 => _gradeinfo3 ?? GradeInfoStruct();
  set gradeinfo3(GradeInfoStruct? val) => _gradeinfo3 = val;

  void updateGradeinfo3(Function(GradeInfoStruct) updateFn) {
    updateFn(_gradeinfo3 ??= GradeInfoStruct());
  }

  bool hasGradeinfo3() => _gradeinfo3 != null;

  // "gradeinfo4" field.
  GradeInfoStruct? _gradeinfo4;
  GradeInfoStruct get gradeinfo4 => _gradeinfo4 ?? GradeInfoStruct();
  set gradeinfo4(GradeInfoStruct? val) => _gradeinfo4 = val;

  void updateGradeinfo4(Function(GradeInfoStruct) updateFn) {
    updateFn(_gradeinfo4 ??= GradeInfoStruct());
  }

  bool hasGradeinfo4() => _gradeinfo4 != null;

  // "gradeinfo5" field.
  GradeInfoStruct? _gradeinfo5;
  GradeInfoStruct get gradeinfo5 => _gradeinfo5 ?? GradeInfoStruct();
  set gradeinfo5(GradeInfoStruct? val) => _gradeinfo5 = val;

  void updateGradeinfo5(Function(GradeInfoStruct) updateFn) {
    updateFn(_gradeinfo5 ??= GradeInfoStruct());
  }

  bool hasGradeinfo5() => _gradeinfo5 != null;

  // "gradeinfo6" field.
  GradeInfoStruct? _gradeinfo6;
  GradeInfoStruct get gradeinfo6 => _gradeinfo6 ?? GradeInfoStruct();
  set gradeinfo6(GradeInfoStruct? val) => _gradeinfo6 = val;

  void updateGradeinfo6(Function(GradeInfoStruct) updateFn) {
    updateFn(_gradeinfo6 ??= GradeInfoStruct());
  }

  bool hasGradeinfo6() => _gradeinfo6 != null;

  // "signature3" field.
  String? _signature3;
  String get signature3 => _signature3 ?? '';
  set signature3(String? val) => _signature3 = val;

  bool hasSignature3() => _signature3 != null;

  static StudyDetailsStruct fromMap(Map<String, dynamic> data) =>
      StudyDetailsStruct(
        forwhat: data['forwhat'] as String?,
        forwhatDetail: data['forwhatDetail'] as String?,
        needConsulting: data['needConsulting'] as bool?,
        needPlannerCoaching: data['needPlannerCoaching'] as bool?,
        signname1: data['signname1'] as String?,
        signname2: data['signname2'] as String?,
        signature1: data['signature1'] as String?,
        signature2: data['signature2'] as String?,
        signManager: data['signManager'] as String?,
        signTime: data['signTime'] as DateTime?,
        firstDate: data['firstDate'] as String?,
        gradeinfo1: data['gradeinfo1'] is GradeInfoStruct
            ? data['gradeinfo1']
            : GradeInfoStruct.maybeFromMap(data['gradeinfo1']),
        gradeinfo2: data['gradeinfo2'] is GradeInfoStruct
            ? data['gradeinfo2']
            : GradeInfoStruct.maybeFromMap(data['gradeinfo2']),
        gradeinfo3: data['gradeinfo3'] is GradeInfoStruct
            ? data['gradeinfo3']
            : GradeInfoStruct.maybeFromMap(data['gradeinfo3']),
        gradeinfo4: data['gradeinfo4'] is GradeInfoStruct
            ? data['gradeinfo4']
            : GradeInfoStruct.maybeFromMap(data['gradeinfo4']),
        gradeinfo5: data['gradeinfo5'] is GradeInfoStruct
            ? data['gradeinfo5']
            : GradeInfoStruct.maybeFromMap(data['gradeinfo5']),
        gradeinfo6: data['gradeinfo6'] is GradeInfoStruct
            ? data['gradeinfo6']
            : GradeInfoStruct.maybeFromMap(data['gradeinfo6']),
        signature3: data['signature3'] as String?,
      );

  static StudyDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? StudyDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'forwhat': _forwhat,
        'forwhatDetail': _forwhatDetail,
        'needConsulting': _needConsulting,
        'needPlannerCoaching': _needPlannerCoaching,
        'signname1': _signname1,
        'signname2': _signname2,
        'signature1': _signature1,
        'signature2': _signature2,
        'signManager': _signManager,
        'signTime': _signTime,
        'firstDate': _firstDate,
        'gradeinfo1': _gradeinfo1?.toMap(),
        'gradeinfo2': _gradeinfo2?.toMap(),
        'gradeinfo3': _gradeinfo3?.toMap(),
        'gradeinfo4': _gradeinfo4?.toMap(),
        'gradeinfo5': _gradeinfo5?.toMap(),
        'gradeinfo6': _gradeinfo6?.toMap(),
        'signature3': _signature3,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'forwhat': serializeParam(
          _forwhat,
          ParamType.String,
        ),
        'forwhatDetail': serializeParam(
          _forwhatDetail,
          ParamType.String,
        ),
        'needConsulting': serializeParam(
          _needConsulting,
          ParamType.bool,
        ),
        'needPlannerCoaching': serializeParam(
          _needPlannerCoaching,
          ParamType.bool,
        ),
        'signname1': serializeParam(
          _signname1,
          ParamType.String,
        ),
        'signname2': serializeParam(
          _signname2,
          ParamType.String,
        ),
        'signature1': serializeParam(
          _signature1,
          ParamType.String,
        ),
        'signature2': serializeParam(
          _signature2,
          ParamType.String,
        ),
        'signManager': serializeParam(
          _signManager,
          ParamType.String,
        ),
        'signTime': serializeParam(
          _signTime,
          ParamType.DateTime,
        ),
        'firstDate': serializeParam(
          _firstDate,
          ParamType.String,
        ),
        'gradeinfo1': serializeParam(
          _gradeinfo1,
          ParamType.DataStruct,
        ),
        'gradeinfo2': serializeParam(
          _gradeinfo2,
          ParamType.DataStruct,
        ),
        'gradeinfo3': serializeParam(
          _gradeinfo3,
          ParamType.DataStruct,
        ),
        'gradeinfo4': serializeParam(
          _gradeinfo4,
          ParamType.DataStruct,
        ),
        'gradeinfo5': serializeParam(
          _gradeinfo5,
          ParamType.DataStruct,
        ),
        'gradeinfo6': serializeParam(
          _gradeinfo6,
          ParamType.DataStruct,
        ),
        'signature3': serializeParam(
          _signature3,
          ParamType.String,
        ),
      }.withoutNulls;

  static StudyDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      StudyDetailsStruct(
        forwhat: deserializeParam(
          data['forwhat'],
          ParamType.String,
          false,
        ),
        forwhatDetail: deserializeParam(
          data['forwhatDetail'],
          ParamType.String,
          false,
        ),
        needConsulting: deserializeParam(
          data['needConsulting'],
          ParamType.bool,
          false,
        ),
        needPlannerCoaching: deserializeParam(
          data['needPlannerCoaching'],
          ParamType.bool,
          false,
        ),
        signname1: deserializeParam(
          data['signname1'],
          ParamType.String,
          false,
        ),
        signname2: deserializeParam(
          data['signname2'],
          ParamType.String,
          false,
        ),
        signature1: deserializeParam(
          data['signature1'],
          ParamType.String,
          false,
        ),
        signature2: deserializeParam(
          data['signature2'],
          ParamType.String,
          false,
        ),
        signManager: deserializeParam(
          data['signManager'],
          ParamType.String,
          false,
        ),
        signTime: deserializeParam(
          data['signTime'],
          ParamType.DateTime,
          false,
        ),
        firstDate: deserializeParam(
          data['firstDate'],
          ParamType.String,
          false,
        ),
        gradeinfo1: deserializeStructParam(
          data['gradeinfo1'],
          ParamType.DataStruct,
          false,
          structBuilder: GradeInfoStruct.fromSerializableMap,
        ),
        gradeinfo2: deserializeStructParam(
          data['gradeinfo2'],
          ParamType.DataStruct,
          false,
          structBuilder: GradeInfoStruct.fromSerializableMap,
        ),
        gradeinfo3: deserializeStructParam(
          data['gradeinfo3'],
          ParamType.DataStruct,
          false,
          structBuilder: GradeInfoStruct.fromSerializableMap,
        ),
        gradeinfo4: deserializeStructParam(
          data['gradeinfo4'],
          ParamType.DataStruct,
          false,
          structBuilder: GradeInfoStruct.fromSerializableMap,
        ),
        gradeinfo5: deserializeStructParam(
          data['gradeinfo5'],
          ParamType.DataStruct,
          false,
          structBuilder: GradeInfoStruct.fromSerializableMap,
        ),
        gradeinfo6: deserializeStructParam(
          data['gradeinfo6'],
          ParamType.DataStruct,
          false,
          structBuilder: GradeInfoStruct.fromSerializableMap,
        ),
        signature3: deserializeParam(
          data['signature3'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StudyDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StudyDetailsStruct &&
        forwhat == other.forwhat &&
        forwhatDetail == other.forwhatDetail &&
        needConsulting == other.needConsulting &&
        needPlannerCoaching == other.needPlannerCoaching &&
        signname1 == other.signname1 &&
        signname2 == other.signname2 &&
        signature1 == other.signature1 &&
        signature2 == other.signature2 &&
        signManager == other.signManager &&
        signTime == other.signTime &&
        firstDate == other.firstDate &&
        gradeinfo1 == other.gradeinfo1 &&
        gradeinfo2 == other.gradeinfo2 &&
        gradeinfo3 == other.gradeinfo3 &&
        gradeinfo4 == other.gradeinfo4 &&
        gradeinfo5 == other.gradeinfo5 &&
        gradeinfo6 == other.gradeinfo6 &&
        signature3 == other.signature3;
  }

  @override
  int get hashCode => const ListEquality().hash([
        forwhat,
        forwhatDetail,
        needConsulting,
        needPlannerCoaching,
        signname1,
        signname2,
        signature1,
        signature2,
        signManager,
        signTime,
        firstDate,
        gradeinfo1,
        gradeinfo2,
        gradeinfo3,
        gradeinfo4,
        gradeinfo5,
        gradeinfo6,
        signature3
      ]);
}

StudyDetailsStruct createStudyDetailsStruct({
  String? forwhat,
  String? forwhatDetail,
  bool? needConsulting,
  bool? needPlannerCoaching,
  String? signname1,
  String? signname2,
  String? signature1,
  String? signature2,
  String? signManager,
  DateTime? signTime,
  String? firstDate,
  GradeInfoStruct? gradeinfo1,
  GradeInfoStruct? gradeinfo2,
  GradeInfoStruct? gradeinfo3,
  GradeInfoStruct? gradeinfo4,
  GradeInfoStruct? gradeinfo5,
  GradeInfoStruct? gradeinfo6,
  String? signature3,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StudyDetailsStruct(
      forwhat: forwhat,
      forwhatDetail: forwhatDetail,
      needConsulting: needConsulting,
      needPlannerCoaching: needPlannerCoaching,
      signname1: signname1,
      signname2: signname2,
      signature1: signature1,
      signature2: signature2,
      signManager: signManager,
      signTime: signTime,
      firstDate: firstDate,
      gradeinfo1: gradeinfo1 ?? (clearUnsetFields ? GradeInfoStruct() : null),
      gradeinfo2: gradeinfo2 ?? (clearUnsetFields ? GradeInfoStruct() : null),
      gradeinfo3: gradeinfo3 ?? (clearUnsetFields ? GradeInfoStruct() : null),
      gradeinfo4: gradeinfo4 ?? (clearUnsetFields ? GradeInfoStruct() : null),
      gradeinfo5: gradeinfo5 ?? (clearUnsetFields ? GradeInfoStruct() : null),
      gradeinfo6: gradeinfo6 ?? (clearUnsetFields ? GradeInfoStruct() : null),
      signature3: signature3,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StudyDetailsStruct? updateStudyDetailsStruct(
  StudyDetailsStruct? studyDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    studyDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStudyDetailsStructData(
  Map<String, dynamic> firestoreData,
  StudyDetailsStruct? studyDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (studyDetails == null) {
    return;
  }
  if (studyDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && studyDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final studyDetailsData =
      getStudyDetailsFirestoreData(studyDetails, forFieldValue);
  final nestedData =
      studyDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = studyDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStudyDetailsFirestoreData(
  StudyDetailsStruct? studyDetails, [
  bool forFieldValue = false,
]) {
  if (studyDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(studyDetails.toMap());

  // Handle nested data for "gradeinfo1" field.
  addGradeInfoStructData(
    firestoreData,
    studyDetails.hasGradeinfo1() ? studyDetails.gradeinfo1 : null,
    'gradeinfo1',
    forFieldValue,
  );

  // Handle nested data for "gradeinfo2" field.
  addGradeInfoStructData(
    firestoreData,
    studyDetails.hasGradeinfo2() ? studyDetails.gradeinfo2 : null,
    'gradeinfo2',
    forFieldValue,
  );

  // Handle nested data for "gradeinfo3" field.
  addGradeInfoStructData(
    firestoreData,
    studyDetails.hasGradeinfo3() ? studyDetails.gradeinfo3 : null,
    'gradeinfo3',
    forFieldValue,
  );

  // Handle nested data for "gradeinfo4" field.
  addGradeInfoStructData(
    firestoreData,
    studyDetails.hasGradeinfo4() ? studyDetails.gradeinfo4 : null,
    'gradeinfo4',
    forFieldValue,
  );

  // Handle nested data for "gradeinfo5" field.
  addGradeInfoStructData(
    firestoreData,
    studyDetails.hasGradeinfo5() ? studyDetails.gradeinfo5 : null,
    'gradeinfo5',
    forFieldValue,
  );

  // Handle nested data for "gradeinfo6" field.
  addGradeInfoStructData(
    firestoreData,
    studyDetails.hasGradeinfo6() ? studyDetails.gradeinfo6 : null,
    'gradeinfo6',
    forFieldValue,
  );

  // Add any Firestore field values
  studyDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStudyDetailsListFirestoreData(
  List<StudyDetailsStruct>? studyDetailss,
) =>
    studyDetailss?.map((e) => getStudyDetailsFirestoreData(e, true)).toList() ??
    [];
