import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlannerVariableListRecord extends FirestoreRecord {
  PlannerVariableListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "inputList" field.
  List<PlannerInputStruct>? _inputList;
  List<PlannerInputStruct> get inputList => _inputList ?? const [];
  bool hasInputList() => _inputList != null;

  // "submittedDate" field.
  DateTime? _submittedDate;
  DateTime? get submittedDate => _submittedDate;
  bool hasSubmittedDate() => _submittedDate != null;

  // "adminChecked" field.
  bool? _adminChecked;
  bool get adminChecked => _adminChecked ?? false;
  bool hasAdminChecked() => _adminChecked != null;

  // "goodThings" field.
  String? _goodThings;
  String get goodThings => _goodThings ?? '';
  bool hasGoodThings() => _goodThings != null;

  // "improvement" field.
  String? _improvement;
  String get improvement => _improvement ?? '';
  bool hasImprovement() => _improvement != null;

  // "teachersQuote" field.
  String? _teachersQuote;
  String get teachersQuote => _teachersQuote ?? '';
  bool hasTeachersQuote() => _teachersQuote != null;

  // "plannerSubmitted" field.
  bool? _plannerSubmitted;
  bool get plannerSubmitted => _plannerSubmitted ?? false;
  bool hasPlannerSubmitted() => _plannerSubmitted != null;

  // "achivementPercentage" field.
  double? _achivementPercentage;
  double get achivementPercentage => _achivementPercentage ?? 0.0;
  bool hasAchivementPercentage() => _achivementPercentage != null;

  // "basicInfo" field.
  BasicUserInfoStruct? _basicInfo;
  BasicUserInfoStruct get basicInfo => _basicInfo ?? BasicUserInfoStruct();
  bool hasBasicInfo() => _basicInfo != null;

  // "dailyStarting" field.
  DailyStartingStruct? _dailyStarting;
  DailyStartingStruct get dailyStarting =>
      _dailyStarting ?? DailyStartingStruct();
  bool hasDailyStarting() => _dailyStarting != null;

  // "timetableStartIndex" field.
  int? _timetableStartIndex;
  int get timetableStartIndex => _timetableStartIndex ?? 0;
  bool hasTimetableStartIndex() => _timetableStartIndex != null;

  // "timetableEndIndex" field.
  int? _timetableEndIndex;
  int get timetableEndIndex => _timetableEndIndex ?? 0;
  bool hasTimetableEndIndex() => _timetableEndIndex != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _inputList = getStructList(
      snapshotData['inputList'],
      PlannerInputStruct.fromMap,
    );
    _submittedDate = snapshotData['submittedDate'] as DateTime?;
    _adminChecked = snapshotData['adminChecked'] as bool?;
    _goodThings = snapshotData['goodThings'] as String?;
    _improvement = snapshotData['improvement'] as String?;
    _teachersQuote = snapshotData['teachersQuote'] as String?;
    _plannerSubmitted = snapshotData['plannerSubmitted'] as bool?;
    _achivementPercentage =
        castToType<double>(snapshotData['achivementPercentage']);
    _basicInfo = snapshotData['basicInfo'] is BasicUserInfoStruct
        ? snapshotData['basicInfo']
        : BasicUserInfoStruct.maybeFromMap(snapshotData['basicInfo']);
    _dailyStarting = snapshotData['dailyStarting'] is DailyStartingStruct
        ? snapshotData['dailyStarting']
        : DailyStartingStruct.maybeFromMap(snapshotData['dailyStarting']);
    _timetableStartIndex = castToType<int>(snapshotData['timetableStartIndex']);
    _timetableEndIndex = castToType<int>(snapshotData['timetableEndIndex']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('plannerVariableList')
          : FirebaseFirestore.instance.collectionGroup('plannerVariableList');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('plannerVariableList').doc(id);

  static Stream<PlannerVariableListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlannerVariableListRecord.fromSnapshot(s));

  static Future<PlannerVariableListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlannerVariableListRecord.fromSnapshot(s));

  static PlannerVariableListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlannerVariableListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlannerVariableListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlannerVariableListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlannerVariableListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlannerVariableListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlannerVariableListRecordData({
  DateTime? submittedDate,
  bool? adminChecked,
  String? goodThings,
  String? improvement,
  String? teachersQuote,
  bool? plannerSubmitted,
  double? achivementPercentage,
  BasicUserInfoStruct? basicInfo,
  DailyStartingStruct? dailyStarting,
  int? timetableStartIndex,
  int? timetableEndIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'submittedDate': submittedDate,
      'adminChecked': adminChecked,
      'goodThings': goodThings,
      'improvement': improvement,
      'teachersQuote': teachersQuote,
      'plannerSubmitted': plannerSubmitted,
      'achivementPercentage': achivementPercentage,
      'basicInfo': BasicUserInfoStruct().toMap(),
      'dailyStarting': DailyStartingStruct().toMap(),
      'timetableStartIndex': timetableStartIndex,
      'timetableEndIndex': timetableEndIndex,
    }.withoutNulls,
  );

  // Handle nested data for "basicInfo" field.
  addBasicUserInfoStructData(firestoreData, basicInfo, 'basicInfo');

  // Handle nested data for "dailyStarting" field.
  addDailyStartingStructData(firestoreData, dailyStarting, 'dailyStarting');

  return firestoreData;
}

class PlannerVariableListRecordDocumentEquality
    implements Equality<PlannerVariableListRecord> {
  const PlannerVariableListRecordDocumentEquality();

  @override
  bool equals(PlannerVariableListRecord? e1, PlannerVariableListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.inputList, e2?.inputList) &&
        e1?.submittedDate == e2?.submittedDate &&
        e1?.adminChecked == e2?.adminChecked &&
        e1?.goodThings == e2?.goodThings &&
        e1?.improvement == e2?.improvement &&
        e1?.teachersQuote == e2?.teachersQuote &&
        e1?.plannerSubmitted == e2?.plannerSubmitted &&
        e1?.achivementPercentage == e2?.achivementPercentage &&
        e1?.basicInfo == e2?.basicInfo &&
        e1?.dailyStarting == e2?.dailyStarting &&
        e1?.timetableStartIndex == e2?.timetableStartIndex &&
        e1?.timetableEndIndex == e2?.timetableEndIndex;
  }

  @override
  int hash(PlannerVariableListRecord? e) => const ListEquality().hash([
        e?.inputList,
        e?.submittedDate,
        e?.adminChecked,
        e?.goodThings,
        e?.improvement,
        e?.teachersQuote,
        e?.plannerSubmitted,
        e?.achivementPercentage,
        e?.basicInfo,
        e?.dailyStarting,
        e?.timetableStartIndex,
        e?.timetableEndIndex
      ]);

  @override
  bool isValidKey(Object? o) => o is PlannerVariableListRecord;
}
