// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyInfoEachStruct extends FFFirebaseStruct {
  DailyInfoEachStruct({
    DateTime? starttime,
    DateTime? endtime,
    Color? colorPicked,
    String? subject,
    String? details,
    String? restinfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _starttime = starttime,
        _endtime = endtime,
        _colorPicked = colorPicked,
        _subject = subject,
        _details = details,
        _restinfo = restinfo,
        super(firestoreUtilData);

  // "starttime" field.
  DateTime? _starttime;
  DateTime? get starttime => _starttime;
  set starttime(DateTime? val) => _starttime = val;

  bool hasStarttime() => _starttime != null;

  // "endtime" field.
  DateTime? _endtime;
  DateTime? get endtime => _endtime;
  set endtime(DateTime? val) => _endtime = val;

  bool hasEndtime() => _endtime != null;

  // "colorPicked" field.
  Color? _colorPicked;
  Color? get colorPicked => _colorPicked;
  set colorPicked(Color? val) => _colorPicked = val;

  bool hasColorPicked() => _colorPicked != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;

  bool hasDetails() => _details != null;

  // "restinfo" field.
  String? _restinfo;
  String get restinfo => _restinfo ?? '';
  set restinfo(String? val) => _restinfo = val;

  bool hasRestinfo() => _restinfo != null;

  static DailyInfoEachStruct fromMap(Map<String, dynamic> data) =>
      DailyInfoEachStruct(
        starttime: data['starttime'] as DateTime?,
        endtime: data['endtime'] as DateTime?,
        colorPicked: getSchemaColor(data['colorPicked']),
        subject: data['subject'] as String?,
        details: data['details'] as String?,
        restinfo: data['restinfo'] as String?,
      );

  static DailyInfoEachStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyInfoEachStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'starttime': _starttime,
        'endtime': _endtime,
        'colorPicked': _colorPicked,
        'subject': _subject,
        'details': _details,
        'restinfo': _restinfo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'starttime': serializeParam(
          _starttime,
          ParamType.DateTime,
        ),
        'endtime': serializeParam(
          _endtime,
          ParamType.DateTime,
        ),
        'colorPicked': serializeParam(
          _colorPicked,
          ParamType.Color,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
        'restinfo': serializeParam(
          _restinfo,
          ParamType.String,
        ),
      }.withoutNulls;

  static DailyInfoEachStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailyInfoEachStruct(
        starttime: deserializeParam(
          data['starttime'],
          ParamType.DateTime,
          false,
        ),
        endtime: deserializeParam(
          data['endtime'],
          ParamType.DateTime,
          false,
        ),
        colorPicked: deserializeParam(
          data['colorPicked'],
          ParamType.Color,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
        restinfo: deserializeParam(
          data['restinfo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DailyInfoEachStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyInfoEachStruct &&
        starttime == other.starttime &&
        endtime == other.endtime &&
        colorPicked == other.colorPicked &&
        subject == other.subject &&
        details == other.details &&
        restinfo == other.restinfo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([starttime, endtime, colorPicked, subject, details, restinfo]);
}

DailyInfoEachStruct createDailyInfoEachStruct({
  DateTime? starttime,
  DateTime? endtime,
  Color? colorPicked,
  String? subject,
  String? details,
  String? restinfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyInfoEachStruct(
      starttime: starttime,
      endtime: endtime,
      colorPicked: colorPicked,
      subject: subject,
      details: details,
      restinfo: restinfo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyInfoEachStruct? updateDailyInfoEachStruct(
  DailyInfoEachStruct? dailyInfoEach, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyInfoEach
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyInfoEachStructData(
  Map<String, dynamic> firestoreData,
  DailyInfoEachStruct? dailyInfoEach,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyInfoEach == null) {
    return;
  }
  if (dailyInfoEach.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyInfoEach.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyInfoEachData =
      getDailyInfoEachFirestoreData(dailyInfoEach, forFieldValue);
  final nestedData =
      dailyInfoEachData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailyInfoEach.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyInfoEachFirestoreData(
  DailyInfoEachStruct? dailyInfoEach, [
  bool forFieldValue = false,
]) {
  if (dailyInfoEach == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyInfoEach.toMap());

  // Add any Firestore field values
  dailyInfoEach.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyInfoEachListFirestoreData(
  List<DailyInfoEachStruct>? dailyInfoEachs,
) =>
    dailyInfoEachs
        ?.map((e) => getDailyInfoEachFirestoreData(e, true))
        .toList() ??
    [];
