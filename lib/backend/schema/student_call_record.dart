import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentCallRecord extends FirestoreRecord {
  StudentCallRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userInfoCall" field.
  BasicUserInfoStruct? _userInfoCall;
  BasicUserInfoStruct get userInfoCall =>
      _userInfoCall ?? BasicUserInfoStruct();
  bool hasUserInfoCall() => _userInfoCall != null;

  void _initializeFields() {
    _userInfoCall = snapshotData['userInfoCall'] is BasicUserInfoStruct
        ? snapshotData['userInfoCall']
        : BasicUserInfoStruct.maybeFromMap(snapshotData['userInfoCall']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('studentCall');

  static Stream<StudentCallRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentCallRecord.fromSnapshot(s));

  static Future<StudentCallRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentCallRecord.fromSnapshot(s));

  static StudentCallRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentCallRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentCallRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentCallRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentCallRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentCallRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentCallRecordData({
  BasicUserInfoStruct? userInfoCall,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userInfoCall': BasicUserInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "userInfoCall" field.
  addBasicUserInfoStructData(firestoreData, userInfoCall, 'userInfoCall');

  return firestoreData;
}

class StudentCallRecordDocumentEquality implements Equality<StudentCallRecord> {
  const StudentCallRecordDocumentEquality();

  @override
  bool equals(StudentCallRecord? e1, StudentCallRecord? e2) {
    return e1?.userInfoCall == e2?.userInfoCall;
  }

  @override
  int hash(StudentCallRecord? e) =>
      const ListEquality().hash([e?.userInfoCall]);

  @override
  bool isValidKey(Object? o) => o is StudentCallRecord;
}
