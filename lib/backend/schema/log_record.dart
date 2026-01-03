import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogRecord extends FirestoreRecord {
  LogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "studentname" field.
  String? _studentname;
  String get studentname => _studentname ?? '';
  bool hasStudentname() => _studentname != null;

  // "managername" field.
  String? _managername;
  String get managername => _managername ?? '';
  bool hasManagername() => _managername != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  void _initializeFields() {
    _time = snapshotData['time'] as DateTime?;
    _studentname = snapshotData['studentname'] as String?;
    _managername = snapshotData['managername'] as String?;
    _reason = snapshotData['reason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('log');

  static Stream<LogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogRecord.fromSnapshot(s));

  static Future<LogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogRecord.fromSnapshot(s));

  static LogRecord fromSnapshot(DocumentSnapshot snapshot) => LogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogRecordData({
  DateTime? time,
  String? studentname,
  String? managername,
  String? reason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'studentname': studentname,
      'managername': managername,
      'reason': reason,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogRecordDocumentEquality implements Equality<LogRecord> {
  const LogRecordDocumentEquality();

  @override
  bool equals(LogRecord? e1, LogRecord? e2) {
    return e1?.time == e2?.time &&
        e1?.studentname == e2?.studentname &&
        e1?.managername == e2?.managername &&
        e1?.reason == e2?.reason;
  }

  @override
  int hash(LogRecord? e) => const ListEquality()
      .hash([e?.time, e?.studentname, e?.managername, e?.reason]);

  @override
  bool isValidKey(Object? o) => o is LogRecord;
}
