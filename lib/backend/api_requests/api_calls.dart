import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCallSheet';

/// Start WEB AUTH Group Code

class WebAuthGroup {
  static String getBaseUrl({
    String? idToken = '',
  }) =>
      'https://naegongstudy.it.com/api/auth/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [idToken]',
    'Content-Type': 'application/json',
    'accept': '*/*',
  };
  static LoginCall loginCall = LoginCall();
  static RefreshCall refreshCall = RefreshCall();
  static LogoutCall logoutCall = LogoutCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? pw = '',
    String? idToken = '',
  }) async {
    final baseUrl = WebAuthGroup.getBaseUrl(
      idToken: idToken,
    );

    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(id)}",
  "password": "${escapeStringForJson(pw)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${baseUrl}login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
        'accept': '*/*',
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

class RefreshCall {
  Future<ApiCallResponse> call({
    String? idToken = '',
  }) async {
    final baseUrl = WebAuthGroup.getBaseUrl(
      idToken: idToken,
    );

    final ffApiRequestBody = '''
''';
    return ApiManager.instance.makeApiCall(
      callName: 'refresh',
      apiUrl: '${baseUrl}refresh',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
        'accept': '*/*',
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

class LogoutCall {
  Future<ApiCallResponse> call({
    String? idToken = '',
  }) async {
    final baseUrl = WebAuthGroup.getBaseUrl(
      idToken: idToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${baseUrl}logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
        'accept': '*/*',
      },
      params: {},
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

/// End WEB AUTH Group Code

/// Start WEB external Group Code

class WEBExternalGroup {
  static String getBaseUrl({
    String? idToken = '',
  }) =>
      'https://naegongstudy.it.com/api/external/flutter';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [idToken]',
    'Content-Type': 'application/json',
    'accept': '*/*',
  };
  static PointPostServerCall pointPostServerCall = PointPostServerCall();
}

class PointPostServerCall {
  Future<ApiCallResponse> call({
    int? id,
    String? studentId = '',
    int? seatNo,
    String? studentName = '',
    int? pointCode,
    String? pointDescription = '',
    String? reason = '',
    int? point,
    String? givenAt = '',
    String? givenBy = '',
    bool? cancelEnabled,
    String? idToken = '',
  }) async {
    final baseUrl = WEBExternalGroup.getBaseUrl(
      idToken: idToken,
    );

    final ffApiRequestBody = '''
{
  "id": "${id}",
  "studentId": "${escapeStringForJson(studentId)}",
  "seatNo": "${seatNo}",
  "studentName": "${escapeStringForJson(studentName)}",
  "pointCode": "${pointCode}",
  "pointDescription": "${escapeStringForJson(pointDescription)}",
  "reason": "${escapeStringForJson(reason)}",
  "point": ${point},
  "givenAt": "${escapeStringForJson(givenAt)}",
  "givenBy": "${escapeStringForJson(givenBy)}",
  "cancelEnabled": ${cancelEnabled}
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'point post server',
      apiUrl: '${baseUrl}/point',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
        'accept': '*/*',
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

/// End WEB external Group Code

/// Start WEB files Copy Group Code

class WEBFilesCopyGroup {
  static String getBaseUrl({
    String? idToken = '',
  }) =>
      'https://naegongstudy.it.com/api/files';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [idToken]',
    'Content-Type': 'application/json',
    'accept': '*/*',
  };
}

/// End WEB files Copy Group Code

/// Start WEB student Group Code

class WEBStudentGroup {
  static String getBaseUrl({
    String? idToken = '',
  }) =>
      'https://naegongstudy.it.com/api/student';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [idToken]',
    'Content-Type': 'application/json',
    'accept': '*/*',
  };
}

/// End WEB student Group Code

/// Start WEB APIs Group Code

class WEBAPIsGroup {
  static String getBaseUrl({
    String? idToken = '',
  }) =>
      'https://naegongstudy.it.com/api/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [idToken]',
    'Content-Type': 'application/json',
    'accept': '*/*',
  };
  static NoRegisterPointCheckEachCall noRegisterPointCheckEachCall =
      NoRegisterPointCheckEachCall();
  static NoRegisterPointCheckListCall noRegisterPointCheckListCall =
      NoRegisterPointCheckListCall();
}

class NoRegisterPointCheckEachCall {
  Future<ApiCallResponse> call({
    String? flutterId = '',
    String? idToken = '',
  }) async {
    final baseUrl = WEBAPIsGroup.getBaseUrl(
      idToken: idToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NoRegister point Check each',
      apiUrl: '${baseUrl}student/public/${flutterId}/point/info',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
        'accept': '*/*',
      },
      params: {
        'flutterId': flutterId,
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

class NoRegisterPointCheckListCall {
  Future<ApiCallResponse> call({
    String? flutterId = '',
    String? idToken = '',
  }) async {
    final baseUrl = WEBAPIsGroup.getBaseUrl(
      idToken: idToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NoRegister point Check list',
      apiUrl: '${baseUrl}student/public/${flutterId}/point/history',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
        'accept': '*/*',
      },
      params: {
        'flutterId': flutterId,
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

/// End WEB APIs Group Code

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

class SheetScheduleCall {
  static Future<ApiCallResponse> call({
    dynamic weeklytimetableJson,
    String? username = '',
    String? spotSheetLink =
        'AKfycbwyrhuv6nokDtw0tvXz7FkgtkyAODd6zYqkmv6xVaPbdolZqCYO-lqdAx7HFALow0uU',
    String? storekey = '',
    String? action = 'schedule',
    String? managername = '미입력',
  }) async {
    final weeklytimetable = _serializeJson(weeklytimetableJson);
    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "jsondata": ${weeklytimetable},
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}",
  "managerName": "${escapeStringForJson(managername)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sheet schedule',
      apiUrl: 'https://adminproxy-ahprm4rspq-du.a.run.app',
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

class SheetSeatAndtimetableCall {
  static Future<ApiCallResponse> call({
    dynamic weeklytimetableJson,
    String? username = '',
    String? spotSheetLink =
        'AKfycbwyrhuv6nokDtw0tvXz7FkgtkyAODd6zYqkmv6xVaPbdolZqCYO-lqdAx7HFALow0uU',
    String? storekey = '',
    String? action = 'insertSeatAndSchedule ',
    int? seatNo,
    String? tName = '미입력',
    String? grade = '성인',
  }) async {
    final weeklytimetable = _serializeJson(weeklytimetableJson);
    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "jsondata": ${weeklytimetable},
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}",
  "seatNo": ${seatNo},
  "tNmae": "${escapeStringForJson(tName)}",
  "grade": "${escapeStringForJson(grade)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sheet seatAndtimetable',
      apiUrl: 'https://adminproxy-ahprm4rspq-du.a.run.app',
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

class SheetCancellationUserCall {
  static Future<ApiCallResponse> call({
    String? spotSheetLink = '',
    String? storekey = '',
    String? action = 'cancellation',
    int? seatNo,
  }) async {
    final ffApiRequestBody = '''
{
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}",
  "seatNo": ${seatNo}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sheet cancellation user',
      apiUrl: 'https://adminproxy-ahprm4rspq-du.a.run.app',
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

class SheetSeatChangeCall {
  static Future<ApiCallResponse> call({
    String? spotSheetLink = '',
    String? storekey = '',
    String? action = 'cancellation',
    int? oseatNo,
    int? nseatNo,
    String? managerName = '미입력',
  }) async {
    final ffApiRequestBody = '''
{
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}",
  "oseatno": ${oseatNo},
  "nseatno": ${nseatNo},
  "managerName": "${escapeStringForJson(managerName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sheet seatChange',
      apiUrl: 'https://adminproxy-ahprm4rspq-du.a.run.app',
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

class SheetContactCall {
  static Future<ApiCallResponse> call({
    String? username = '-',
    String? spotSheetLink =
        'AKfycbwyrhuv6nokDtw0tvXz7FkgtkyAODd6zYqkmv6xVaPbdolZqCYO-lqdAx7HFALow0uU',
    String? storekey = '-',
    String? action = 'contact',
    String? phoneNumber = '-',
    String? parentsPhoneNumber1 = '-',
    String? parentsPhoneNumber2 = '-',
    String? school = '-',
    String? grade = '-',
  }) async {
    final ffApiRequestBody = '''
{
  "username1": "${escapeStringForJson(username)}",
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}",
  "parents_phone_number1": "${escapeStringForJson(parentsPhoneNumber1)}",
  "parents_phone_number2": "${escapeStringForJson(parentsPhoneNumber2)}",
  "school": "${escapeStringForJson(school)}",
  "grade": "${escapeStringForJson(grade)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sheet contact',
      apiUrl: 'https://adminproxy-ahprm4rspq-du.a.run.app',
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

class SheetPenaltyCall {
  static Future<ApiCallResponse> call({
    String? username = '-',
    String? spotSheetLink =
        'AKfycbwyrhuv6nokDtw0tvXz7FkgtkyAODd6zYqkmv6xVaPbdolZqCYO-lqdAx7HFALow0uU',
    String? storekey = '-',
    String? action = 'penalty',
    String? penaltyreason = '-',
    double? penaltypoint = 0.0,
    String? dateIso = '',
    bool? gb,
    String? id = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}",
  "reason": "${escapeStringForJson(penaltyreason)}",
  "penalty": ${penaltypoint},
  "dateIso": "${escapeStringForJson(dateIso)}",
  "ID": "${escapeStringForJson(id)}",
  "gb": ${gb}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sheet penalty',
      apiUrl: 'https://adminproxy-ahprm4rspq-du.a.run.app',
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

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
}

class SheetInoutFlagCall {
  static Future<ApiCallResponse> call({
    String? username = '-',
    String? spotSheetLink =
        'AKfycbwyrhuv6nokDtw0tvXz7FkgtkyAODd6zYqkmv6xVaPbdolZqCYO-lqdAx7HFALow0uU',
    String? storekey = '-',
    String? action = 'inoutFlag',
    bool? inout,
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}",
  "inout":${inout}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sheet inoutFlag',
      apiUrl: 'https://adminproxy-ahprm4rspq-du.a.run.app',
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

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
}

class ChangeCellColorCall {
  static Future<ApiCallResponse> call({
    String? studentname = '',
    bool? isgoing,
    String? spotSheetLink =
        'AKfycbwyrhuv6nokDtw0tvXz7FkgtkyAODd6zYqkmv6xVaPbdolZqCYO-lqdAx7HFALow0uU',
    String? action = 'attendance',
    String? storekey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "studentname": "${escapeStringForJson(studentname)}",
  "isgoing": ${isgoing},
  "spotSheetLink": "${escapeStringForJson(spotSheetLink)}",
  "action": "${escapeStringForJson(action)}",
  "storekey": "${escapeStringForJson(storekey)}"
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

class WebupdaterCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "userId": "hqGFj8VXOpdMCuoNiMC7zpYgwKf2",
  "updateData": {
    "display_name": "홍길동",
    "age": 16
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'webupdater',
      apiUrl:
          'https://asia-northeast3-naegong-student-qgbwcp.cloudfunctions.net/updateUserData',
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
