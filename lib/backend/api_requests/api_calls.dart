import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall2';

class GetFromSheetCall {
  static Future<ApiCallResponse> call({
    String? userDisplayName = '',
    String? spotSheetLink = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFromSheet',
      apiUrl: 'https://script.google.com/macros/s/${spotSheetLink}/exec',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'displayName': userDisplayName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CallWriteByStudentCall {
  static Future<ApiCallResponse> call({
    String? callreason = '',
    String? calltime = '',
    bool? checked,
    String? seatno = '',
    String? spotname = '',
  }) async {
    final ffApiRequestBody = '''
{
  "callreason": "${callreason}",
  "calltime": "${calltime}",
  "checked": false,
  "seatno": "${seatno}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'callWriteByStudent',
      apiUrl:
          'https://naegong-student-qgbwcp-default-rtdb.asia-southeast1.firebasedatabase.app/calls/${spotname}.json',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RealtimeDatabaseReadListLogicCall {
  static Future<ApiCallResponse> call({
    String? spot = '',
    String? seatno = '',
    String? calltime = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'RealtimeDatabase Read List Logic',
      apiUrl:
          'https://naegong-student-qgbwcp-default-rtdb.asia-southeast1.firebasedatabase.app/calls/${spot}/.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'spot': spot,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TimetablechangerCall {
  static Future<ApiCallResponse> call({
    dynamic weeklytimetableJson,
    String? username = '',
    String? spotSheetLink = '',
  }) async {
    final weeklytimetable = _serializeJson(weeklytimetableJson);
    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "jsondata": ${weeklytimetable}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'timetablechanger',
      apiUrl: 'https://script.google.com/macros/s/${spotSheetLink}/exec',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeCellColorCall {
  static Future<ApiCallResponse> call({
    String? studentname = '',
    bool? isgoing,
    String? spotSheetLink = '',
  }) async {
    final ffApiRequestBody = '''
{
  "studentname": "${escapeStringForJson(studentname)}",
  "isgoing": ${isgoing},
  "spotSheetLink": "${escapeStringForJson(spotSheetLink)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeCellColor',
      apiUrl: 'https://script.google.com/macros/s/${spotSheetLink}/exec',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ACall {
  static Future<ApiCallResponse> call({
    String? spot = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'a',
      apiUrl:
          'https://naegong-student-qgbwcp-default-rtdb.asia-southeast1.firebasedatabase.app/userCheck/${spot}/.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'spot': spot,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? lml(dynamic response) => (getJsonField(
        response,
        r'''$.*.totalActiveUsers''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
