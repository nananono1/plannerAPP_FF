import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimeOverallRecord extends FirestoreRecord {
  TimeOverallRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "studytimelist" field.
  List<SpotDailyDataStruct>? _studytimelist;
  List<SpotDailyDataStruct> get studytimelist => _studytimelist ?? const [];
  bool hasStudytimelist() => _studytimelist != null;

  void _initializeFields() {
    _studytimelist = getStructList(
      snapshotData['studytimelist'],
      SpotDailyDataStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('timeOverall');

  static Stream<TimeOverallRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TimeOverallRecord.fromSnapshot(s));

  static Future<TimeOverallRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TimeOverallRecord.fromSnapshot(s));

  static TimeOverallRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TimeOverallRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TimeOverallRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TimeOverallRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TimeOverallRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TimeOverallRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTimeOverallRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TimeOverallRecordDocumentEquality implements Equality<TimeOverallRecord> {
  const TimeOverallRecordDocumentEquality();

  @override
  bool equals(TimeOverallRecord? e1, TimeOverallRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.studytimelist, e2?.studytimelist);
  }

  @override
  int hash(TimeOverallRecord? e) =>
      const ListEquality().hash([e?.studytimelist]);

  @override
  bool isValidKey(Object? o) => o is TimeOverallRecord;
}
