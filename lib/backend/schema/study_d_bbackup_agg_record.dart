import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyDBbackupAggRecord extends FirestoreRecord {
  StudyDBbackupAggRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastMigratedAt" field.
  DateTime? _lastMigratedAt;
  DateTime? get lastMigratedAt => _lastMigratedAt;
  bool hasLastMigratedAt() => _lastMigratedAt != null;

  // "studyDBbackup" field.
  List<PageStateSchemaStruct>? _studyDBbackup;
  List<PageStateSchemaStruct> get studyDBbackup => _studyDBbackup ?? const [];
  bool hasStudyDBbackup() => _studyDBbackup != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _lastMigratedAt = snapshotData['lastMigratedAt'] as DateTime?;
    _studyDBbackup = getStructList(
      snapshotData['studyDBbackup'],
      PageStateSchemaStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('studyDBbackupAgg')
          : FirebaseFirestore.instance.collectionGroup('studyDBbackupAgg');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('studyDBbackupAgg').doc(id);

  static Stream<StudyDBbackupAggRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudyDBbackupAggRecord.fromSnapshot(s));

  static Future<StudyDBbackupAggRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => StudyDBbackupAggRecord.fromSnapshot(s));

  static StudyDBbackupAggRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudyDBbackupAggRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudyDBbackupAggRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudyDBbackupAggRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudyDBbackupAggRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudyDBbackupAggRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudyDBbackupAggRecordData({
  DateTime? lastMigratedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMigratedAt': lastMigratedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudyDBbackupAggRecordDocumentEquality
    implements Equality<StudyDBbackupAggRecord> {
  const StudyDBbackupAggRecordDocumentEquality();

  @override
  bool equals(StudyDBbackupAggRecord? e1, StudyDBbackupAggRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMigratedAt == e2?.lastMigratedAt &&
        listEquality.equals(e1?.studyDBbackup, e2?.studyDBbackup);
  }

  @override
  int hash(StudyDBbackupAggRecord? e) =>
      const ListEquality().hash([e?.lastMigratedAt, e?.studyDBbackup]);

  @override
  bool isValidKey(Object? o) => o is StudyDBbackupAggRecord;
}
