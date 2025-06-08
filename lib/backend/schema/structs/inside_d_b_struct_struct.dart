// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsideDBStructStruct extends FFFirebaseStruct {
  InsideDBStructStruct({
    List<PageStateSchemaStruct>? pageSchemaEach,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pageSchemaEach = pageSchemaEach,
        super(firestoreUtilData);

  // "pageSchemaEach" field.
  List<PageStateSchemaStruct>? _pageSchemaEach;
  List<PageStateSchemaStruct> get pageSchemaEach => _pageSchemaEach ?? const [];
  set pageSchemaEach(List<PageStateSchemaStruct>? val) => _pageSchemaEach = val;

  void updatePageSchemaEach(Function(List<PageStateSchemaStruct>) updateFn) {
    updateFn(_pageSchemaEach ??= []);
  }

  bool hasPageSchemaEach() => _pageSchemaEach != null;

  static InsideDBStructStruct fromMap(Map<String, dynamic> data) =>
      InsideDBStructStruct(
        pageSchemaEach: getStructList(
          data['pageSchemaEach'],
          PageStateSchemaStruct.fromMap,
        ),
      );

  static InsideDBStructStruct? maybeFromMap(dynamic data) => data is Map
      ? InsideDBStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pageSchemaEach': _pageSchemaEach?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pageSchemaEach': serializeParam(
          _pageSchemaEach,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static InsideDBStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      InsideDBStructStruct(
        pageSchemaEach: deserializeStructParam<PageStateSchemaStruct>(
          data['pageSchemaEach'],
          ParamType.DataStruct,
          true,
          structBuilder: PageStateSchemaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'InsideDBStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InsideDBStructStruct &&
        listEquality.equals(pageSchemaEach, other.pageSchemaEach);
  }

  @override
  int get hashCode => const ListEquality().hash([pageSchemaEach]);
}

InsideDBStructStruct createInsideDBStructStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InsideDBStructStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InsideDBStructStruct? updateInsideDBStructStruct(
  InsideDBStructStruct? insideDBStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    insideDBStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInsideDBStructStructData(
  Map<String, dynamic> firestoreData,
  InsideDBStructStruct? insideDBStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (insideDBStruct == null) {
    return;
  }
  if (insideDBStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && insideDBStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final insideDBStructData =
      getInsideDBStructFirestoreData(insideDBStruct, forFieldValue);
  final nestedData =
      insideDBStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = insideDBStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInsideDBStructFirestoreData(
  InsideDBStructStruct? insideDBStruct, [
  bool forFieldValue = false,
]) {
  if (insideDBStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(insideDBStruct.toMap());

  // Add any Firestore field values
  insideDBStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInsideDBStructListFirestoreData(
  List<InsideDBStructStruct>? insideDBStructs,
) =>
    insideDBStructs
        ?.map((e) => getInsideDBStructFirestoreData(e, true))
        .toList() ??
    [];
