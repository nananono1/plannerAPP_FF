// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NotificationRemoteConfigEachStruct extends FFFirebaseStruct {
  NotificationRemoteConfigEachStruct({
    String? imageUrl,
    String? contentUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageUrl = imageUrl,
        _contentUrl = contentUrl,
        super(firestoreUtilData);

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "contentUrl" field.
  String? _contentUrl;
  String get contentUrl => _contentUrl ?? '';
  set contentUrl(String? val) => _contentUrl = val;

  bool hasContentUrl() => _contentUrl != null;

  static NotificationRemoteConfigEachStruct fromMap(
          Map<String, dynamic> data) =>
      NotificationRemoteConfigEachStruct(
        imageUrl: data['imageUrl'] as String?,
        contentUrl: data['contentUrl'] as String?,
      );

  static NotificationRemoteConfigEachStruct? maybeFromMap(dynamic data) => data
          is Map
      ? NotificationRemoteConfigEachStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imageUrl': _imageUrl,
        'contentUrl': _contentUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'contentUrl': serializeParam(
          _contentUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationRemoteConfigEachStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationRemoteConfigEachStruct(
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        contentUrl: deserializeParam(
          data['contentUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationRemoteConfigEachStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationRemoteConfigEachStruct &&
        imageUrl == other.imageUrl &&
        contentUrl == other.contentUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([imageUrl, contentUrl]);
}

NotificationRemoteConfigEachStruct createNotificationRemoteConfigEachStruct({
  String? imageUrl,
  String? contentUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationRemoteConfigEachStruct(
      imageUrl: imageUrl,
      contentUrl: contentUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationRemoteConfigEachStruct? updateNotificationRemoteConfigEachStruct(
  NotificationRemoteConfigEachStruct? notificationRemoteConfigEach, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationRemoteConfigEach
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationRemoteConfigEachStructData(
  Map<String, dynamic> firestoreData,
  NotificationRemoteConfigEachStruct? notificationRemoteConfigEach,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationRemoteConfigEach == null) {
    return;
  }
  if (notificationRemoteConfigEach.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      notificationRemoteConfigEach.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationRemoteConfigEachData =
      getNotificationRemoteConfigEachFirestoreData(
          notificationRemoteConfigEach, forFieldValue);
  final nestedData = notificationRemoteConfigEachData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      notificationRemoteConfigEach.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationRemoteConfigEachFirestoreData(
  NotificationRemoteConfigEachStruct? notificationRemoteConfigEach, [
  bool forFieldValue = false,
]) {
  if (notificationRemoteConfigEach == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationRemoteConfigEach.toMap());

  // Add any Firestore field values
  notificationRemoteConfigEach.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationRemoteConfigEachListFirestoreData(
  List<NotificationRemoteConfigEachStruct>? notificationRemoteConfigEachs,
) =>
    notificationRemoteConfigEachs
        ?.map((e) => getNotificationRemoteConfigEachFirestoreData(e, true))
        .toList() ??
    [];
