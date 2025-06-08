import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AverageTimeBySpotRecord extends FirestoreRecord {
  AverageTimeBySpotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "spot" field.
  String? _spot;
  String get spot => _spot ?? '';
  bool hasSpot() => _spot != null;

  // "studyTime" field.
  List<SpotStudytimeEachStruct>? _studyTime;
  List<SpotStudytimeEachStruct> get studyTime => _studyTime ?? const [];
  bool hasStudyTime() => _studyTime != null;

  void _initializeFields() {
    _spot = snapshotData['spot'] as String?;
    _studyTime = getStructList(
      snapshotData['studyTime'],
      SpotStudytimeEachStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('averageTimeBySpot');

  static Stream<AverageTimeBySpotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AverageTimeBySpotRecord.fromSnapshot(s));

  static Future<AverageTimeBySpotRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AverageTimeBySpotRecord.fromSnapshot(s));

  static AverageTimeBySpotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AverageTimeBySpotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AverageTimeBySpotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AverageTimeBySpotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AverageTimeBySpotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AverageTimeBySpotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAverageTimeBySpotRecordData({
  String? spot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'spot': spot,
    }.withoutNulls,
  );

  return firestoreData;
}

class AverageTimeBySpotRecordDocumentEquality
    implements Equality<AverageTimeBySpotRecord> {
  const AverageTimeBySpotRecordDocumentEquality();

  @override
  bool equals(AverageTimeBySpotRecord? e1, AverageTimeBySpotRecord? e2) {
    const listEquality = ListEquality();
    return e1?.spot == e2?.spot &&
        listEquality.equals(e1?.studyTime, e2?.studyTime);
  }

  @override
  int hash(AverageTimeBySpotRecord? e) =>
      const ListEquality().hash([e?.spot, e?.studyTime]);

  @override
  bool isValidKey(Object? o) => o is AverageTimeBySpotRecord;
}
