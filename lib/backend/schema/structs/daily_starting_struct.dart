// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DailyStartingStruct extends FFFirebaseStruct {
  DailyStartingStruct({
    DateTime? sleepTime,
    DateTime? getupTime,
    String? goalTime,
    String? commentOfDay,
    int? pointget,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sleepTime = sleepTime,
        _getupTime = getupTime,
        _goalTime = goalTime,
        _commentOfDay = commentOfDay,
        _pointget = pointget,
        super(firestoreUtilData);

  // "sleepTime" field.
  DateTime? _sleepTime;
  DateTime? get sleepTime => _sleepTime;
  set sleepTime(DateTime? val) => _sleepTime = val;

  bool hasSleepTime() => _sleepTime != null;

  // "getupTime" field.
  DateTime? _getupTime;
  DateTime? get getupTime => _getupTime;
  set getupTime(DateTime? val) => _getupTime = val;

  bool hasGetupTime() => _getupTime != null;

  // "goalTime" field.
  String? _goalTime;
  String get goalTime => _goalTime ?? '';
  set goalTime(String? val) => _goalTime = val;

  bool hasGoalTime() => _goalTime != null;

  // "CommentOfDay" field.
  String? _commentOfDay;
  String get commentOfDay => _commentOfDay ?? '';
  set commentOfDay(String? val) => _commentOfDay = val;

  bool hasCommentOfDay() => _commentOfDay != null;

  // "pointget" field.
  int? _pointget;
  int get pointget => _pointget ?? 0;
  set pointget(int? val) => _pointget = val;

  void incrementPointget(int amount) => pointget = pointget + amount;

  bool hasPointget() => _pointget != null;

  static DailyStartingStruct fromMap(Map<String, dynamic> data) =>
      DailyStartingStruct(
        sleepTime: data['sleepTime'] as DateTime?,
        getupTime: data['getupTime'] as DateTime?,
        goalTime: data['goalTime'] as String?,
        commentOfDay: data['CommentOfDay'] as String?,
        pointget: castToType<int>(data['pointget']),
      );

  static DailyStartingStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyStartingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sleepTime': _sleepTime,
        'getupTime': _getupTime,
        'goalTime': _goalTime,
        'CommentOfDay': _commentOfDay,
        'pointget': _pointget,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sleepTime': serializeParam(
          _sleepTime,
          ParamType.DateTime,
        ),
        'getupTime': serializeParam(
          _getupTime,
          ParamType.DateTime,
        ),
        'goalTime': serializeParam(
          _goalTime,
          ParamType.String,
        ),
        'CommentOfDay': serializeParam(
          _commentOfDay,
          ParamType.String,
        ),
        'pointget': serializeParam(
          _pointget,
          ParamType.int,
        ),
      }.withoutNulls;

  static DailyStartingStruct fromSerializableMap(Map<String, dynamic> data) =>
      DailyStartingStruct(
        sleepTime: deserializeParam(
          data['sleepTime'],
          ParamType.DateTime,
          false,
        ),
        getupTime: deserializeParam(
          data['getupTime'],
          ParamType.DateTime,
          false,
        ),
        goalTime: deserializeParam(
          data['goalTime'],
          ParamType.String,
          false,
        ),
        commentOfDay: deserializeParam(
          data['CommentOfDay'],
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
  String toString() => 'DailyStartingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyStartingStruct &&
        sleepTime == other.sleepTime &&
        getupTime == other.getupTime &&
        goalTime == other.goalTime &&
        commentOfDay == other.commentOfDay &&
        pointget == other.pointget;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([sleepTime, getupTime, goalTime, commentOfDay, pointget]);
}

DailyStartingStruct createDailyStartingStruct({
  DateTime? sleepTime,
  DateTime? getupTime,
  String? goalTime,
  String? commentOfDay,
  int? pointget,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyStartingStruct(
      sleepTime: sleepTime,
      getupTime: getupTime,
      goalTime: goalTime,
      commentOfDay: commentOfDay,
      pointget: pointget,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyStartingStruct? updateDailyStartingStruct(
  DailyStartingStruct? dailyStarting, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyStarting
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyStartingStructData(
  Map<String, dynamic> firestoreData,
  DailyStartingStruct? dailyStarting,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyStarting == null) {
    return;
  }
  if (dailyStarting.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyStarting.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyStartingData =
      getDailyStartingFirestoreData(dailyStarting, forFieldValue);
  final nestedData =
      dailyStartingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dailyStarting.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyStartingFirestoreData(
  DailyStartingStruct? dailyStarting, [
  bool forFieldValue = false,
]) {
  if (dailyStarting == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyStarting.toMap());

  // Add any Firestore field values
  dailyStarting.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyStartingListFirestoreData(
  List<DailyStartingStruct>? dailyStartings,
) =>
    dailyStartings
        ?.map((e) => getDailyStartingFirestoreData(e, true))
        .toList() ??
    [];
