import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthlyRankRecord extends FirestoreRecord {
  MonthlyRankRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dateMade" field.
  DateTime? _dateMade;
  DateTime? get dateMade => _dateMade;
  bool hasDateMade() => _dateMade != null;

  // "monthlyRankInfo" field.
  List<RankInfoStruct>? _monthlyRankInfo;
  List<RankInfoStruct> get monthlyRankInfo => _monthlyRankInfo ?? const [];
  bool hasMonthlyRankInfo() => _monthlyRankInfo != null;

  // "toggleOnOff" field.
  bool? _toggleOnOff;
  bool get toggleOnOff => _toggleOnOff ?? false;
  bool hasToggleOnOff() => _toggleOnOff != null;

  void _initializeFields() {
    _dateMade = snapshotData['dateMade'] as DateTime?;
    _monthlyRankInfo = getStructList(
      snapshotData['monthlyRankInfo'],
      RankInfoStruct.fromMap,
    );
    _toggleOnOff = snapshotData['toggleOnOff'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('monthlyRank');

  static Stream<MonthlyRankRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MonthlyRankRecord.fromSnapshot(s));

  static Future<MonthlyRankRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MonthlyRankRecord.fromSnapshot(s));

  static MonthlyRankRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MonthlyRankRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MonthlyRankRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MonthlyRankRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MonthlyRankRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MonthlyRankRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMonthlyRankRecordData({
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

class MonthlyRankRecordDocumentEquality implements Equality<MonthlyRankRecord> {
  const MonthlyRankRecordDocumentEquality();

  @override
  bool equals(MonthlyRankRecord? e1, MonthlyRankRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateMade == e2?.dateMade &&
        listEquality.equals(e1?.monthlyRankInfo, e2?.monthlyRankInfo) &&
        e1?.toggleOnOff == e2?.toggleOnOff;
  }

  @override
  int hash(MonthlyRankRecord? e) => const ListEquality()
      .hash([e?.dateMade, e?.monthlyRankInfo, e?.toggleOnOff]);

  @override
  bool isValidKey(Object? o) => o is MonthlyRankRecord;
}
