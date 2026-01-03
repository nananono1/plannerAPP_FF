import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointListEachAggRecord extends FirestoreRecord {
  PointListEachAggRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastMigratedAt" field.
  DateTime? _lastMigratedAt;
  DateTime? get lastMigratedAt => _lastMigratedAt;
  bool hasLastMigratedAt() => _lastMigratedAt != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "penaltyInputList" field.
  List<PenaltyInputStruct>? _penaltyInputList;
  List<PenaltyInputStruct> get penaltyInputList =>
      _penaltyInputList ?? const [];
  bool hasPenaltyInputList() => _penaltyInputList != null;

  // "pointInputList" field.
  List<PointInputStruct>? _pointInputList;
  List<PointInputStruct> get pointInputList => _pointInputList ?? const [];
  bool hasPointInputList() => _pointInputList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _lastMigratedAt = snapshotData['lastMigratedAt'] as DateTime?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _penaltyInputList = getStructList(
      snapshotData['penaltyInputList'],
      PenaltyInputStruct.fromMap,
    );
    _pointInputList = getStructList(
      snapshotData['pointInputList'],
      PointInputStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pointListEachAgg')
          : FirebaseFirestore.instance.collectionGroup('pointListEachAgg');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pointListEachAgg').doc(id);

  static Stream<PointListEachAggRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PointListEachAggRecord.fromSnapshot(s));

  static Future<PointListEachAggRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PointListEachAggRecord.fromSnapshot(s));

  static PointListEachAggRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PointListEachAggRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PointListEachAggRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PointListEachAggRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PointListEachAggRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PointListEachAggRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPointListEachAggRecordData({
  DateTime? lastMigratedAt,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMigratedAt': lastMigratedAt,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PointListEachAggRecordDocumentEquality
    implements Equality<PointListEachAggRecord> {
  const PointListEachAggRecordDocumentEquality();

  @override
  bool equals(PointListEachAggRecord? e1, PointListEachAggRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMigratedAt == e2?.lastMigratedAt &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.penaltyInputList, e2?.penaltyInputList) &&
        listEquality.equals(e1?.pointInputList, e2?.pointInputList);
  }

  @override
  int hash(PointListEachAggRecord? e) => const ListEquality().hash(
      [e?.lastMigratedAt, e?.uid, e?.penaltyInputList, e?.pointInputList]);

  @override
  bool isValidKey(Object? o) => o is PointListEachAggRecord;
}
