import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "seatNoRequest" field.
  int? _seatNoRequest;
  int get seatNoRequest => _seatNoRequest ?? 0;
  bool hasSeatNoRequest() => _seatNoRequest != null;

  // "statusRequest" field.
  String? _statusRequest;
  String get statusRequest => _statusRequest ?? '';
  bool hasStatusRequest() => _statusRequest != null;

  // "spotRequest" field.
  String? _spotRequest;
  String get spotRequest => _spotRequest ?? '';
  bool hasSpotRequest() => _spotRequest != null;

  // "ifChecked" field.
  bool? _ifChecked;
  bool get ifChecked => _ifChecked ?? false;
  bool hasIfChecked() => _ifChecked != null;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _seatNoRequest = castToType<int>(snapshotData['seatNoRequest']);
    _statusRequest = snapshotData['statusRequest'] as String?;
    _spotRequest = snapshotData['spotRequest'] as String?;
    _ifChecked = snapshotData['ifChecked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  String? username,
  int? seatNoRequest,
  String? statusRequest,
  String? spotRequest,
  bool? ifChecked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'seatNoRequest': seatNoRequest,
      'statusRequest': statusRequest,
      'spotRequest': spotRequest,
      'ifChecked': ifChecked,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.username == e2?.username &&
        e1?.seatNoRequest == e2?.seatNoRequest &&
        e1?.statusRequest == e2?.statusRequest &&
        e1?.spotRequest == e2?.spotRequest &&
        e1?.ifChecked == e2?.ifChecked;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality().hash([
        e?.username,
        e?.seatNoRequest,
        e?.statusRequest,
        e?.spotRequest,
        e?.ifChecked
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
