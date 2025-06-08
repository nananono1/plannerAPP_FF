import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyRankRecord extends FirestoreRecord {
  WeeklyRankRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dateMade" field.
  DateTime? _dateMade;
  DateTime? get dateMade => _dateMade;
  bool hasDateMade() => _dateMade != null;

  // "weeklyRankInfo" field.
  List<RankInfoStruct>? _weeklyRankInfo;
  List<RankInfoStruct> get weeklyRankInfo => _weeklyRankInfo ?? const [];
  bool hasWeeklyRankInfo() => _weeklyRankInfo != null;

  // "toggleOnOff" field.
  bool? _toggleOnOff;
  bool get toggleOnOff => _toggleOnOff ?? false;
  bool hasToggleOnOff() => _toggleOnOff != null;

  void _initializeFields() {
    _dateMade = snapshotData['dateMade'] as DateTime?;
    _weeklyRankInfo = getStructList(
      snapshotData['weeklyRankInfo'],
      RankInfoStruct.fromMap,
    );
    _toggleOnOff = snapshotData['toggleOnOff'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weeklyRank');

  static Stream<WeeklyRankRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeeklyRankRecord.fromSnapshot(s));

  static Future<WeeklyRankRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeeklyRankRecord.fromSnapshot(s));

  static WeeklyRankRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeeklyRankRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeeklyRankRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeeklyRankRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeeklyRankRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeeklyRankRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeeklyRankRecordData({
  DateTime? dateMade,
  bool? toggleOnOff,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateMade': dateMade,
      'toggleOnOff': toggleOnOff,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeeklyRankRecordDocumentEquality implements Equality<WeeklyRankRecord> {
  const WeeklyRankRecordDocumentEquality();

  @override
  bool equals(WeeklyRankRecord? e1, WeeklyRankRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateMade == e2?.dateMade &&
        listEquality.equals(e1?.weeklyRankInfo, e2?.weeklyRankInfo) &&
        e1?.toggleOnOff == e2?.toggleOnOff;
  }

  @override
  int hash(WeeklyRankRecord? e) => const ListEquality()
      .hash([e?.dateMade, e?.weeklyRankInfo, e?.toggleOnOff]);

  @override
  bool isValidKey(Object? o) => o is WeeklyRankRecord;
}
