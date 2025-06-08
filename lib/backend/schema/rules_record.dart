import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RulesRecord extends FirestoreRecord {
  RulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "privacyPolicy" field.
  RulesSchemaStruct? _privacyPolicy;
  RulesSchemaStruct get privacyPolicy => _privacyPolicy ?? RulesSchemaStruct();
  bool hasPrivacyPolicy() => _privacyPolicy != null;

  // "termsOfService" field.
  RulesSchemaStruct? _termsOfService;
  RulesSchemaStruct get termsOfService =>
      _termsOfService ?? RulesSchemaStruct();
  bool hasTermsOfService() => _termsOfService != null;

  void _initializeFields() {
    _privacyPolicy = snapshotData['privacyPolicy'] is RulesSchemaStruct
        ? snapshotData['privacyPolicy']
        : RulesSchemaStruct.maybeFromMap(snapshotData['privacyPolicy']);
    _termsOfService = snapshotData['termsOfService'] is RulesSchemaStruct
        ? snapshotData['termsOfService']
        : RulesSchemaStruct.maybeFromMap(snapshotData['termsOfService']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rules');

  static Stream<RulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RulesRecord.fromSnapshot(s));

  static Future<RulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RulesRecord.fromSnapshot(s));

  static RulesRecord fromSnapshot(DocumentSnapshot snapshot) => RulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRulesRecordData({
  RulesSchemaStruct? privacyPolicy,
  RulesSchemaStruct? termsOfService,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'privacyPolicy': RulesSchemaStruct().toMap(),
      'termsOfService': RulesSchemaStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "privacyPolicy" field.
  addRulesSchemaStructData(firestoreData, privacyPolicy, 'privacyPolicy');

  // Handle nested data for "termsOfService" field.
  addRulesSchemaStructData(firestoreData, termsOfService, 'termsOfService');

  return firestoreData;
}

class RulesRecordDocumentEquality implements Equality<RulesRecord> {
  const RulesRecordDocumentEquality();

  @override
  bool equals(RulesRecord? e1, RulesRecord? e2) {
    return e1?.privacyPolicy == e2?.privacyPolicy &&
        e1?.termsOfService == e2?.termsOfService;
  }

  @override
  int hash(RulesRecord? e) =>
      const ListEquality().hash([e?.privacyPolicy, e?.termsOfService]);

  @override
  bool isValidKey(Object? o) => o is RulesRecord;
}
