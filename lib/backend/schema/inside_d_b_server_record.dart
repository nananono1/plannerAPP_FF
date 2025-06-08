import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsideDBServerRecord extends FirestoreRecord {
  InsideDBServerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DBLIST" field.
  List<InsideDBStructStruct>? _dblist;
  List<InsideDBStructStruct> get dblist => _dblist ?? const [];
  bool hasDblist() => _dblist != null;

  // "spotName" field.
  String? _spotName;
  String get spotName => _spotName ?? '';
  bool hasSpotName() => _spotName != null;

  void _initializeFields() {
    _dblist = getStructList(
      snapshotData['DBLIST'],
      InsideDBStructStruct.fromMap,
    );
    _spotName = snapshotData['spotName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('insideDBServer');

  static Stream<InsideDBServerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsideDBServerRecord.fromSnapshot(s));

  static Future<InsideDBServerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InsideDBServerRecord.fromSnapshot(s));

  static InsideDBServerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsideDBServerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsideDBServerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsideDBServerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsideDBServerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsideDBServerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsideDBServerRecordData({
  String? spotName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'spotName': spotName,
    }.withoutNulls,
  );

  return firestoreData;
}

class InsideDBServerRecordDocumentEquality
    implements Equality<InsideDBServerRecord> {
  const InsideDBServerRecordDocumentEquality();

  @override
  bool equals(InsideDBServerRecord? e1, InsideDBServerRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.dblist, e2?.dblist) &&
        e1?.spotName == e2?.spotName;
  }

  @override
  int hash(InsideDBServerRecord? e) =>
      const ListEquality().hash([e?.dblist, e?.spotName]);

  @override
  bool isValidKey(Object? o) => o is InsideDBServerRecord;
}
