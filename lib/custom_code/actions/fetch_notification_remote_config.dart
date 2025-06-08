// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'dart:convert';

Future<List<NotificationRemoteConfigEachStruct>>
    fetchNotificationRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  // Remote Config 데이터 가져오기
  try {
    // Remote Config 데이터 가져오기 및 활성화
    await remoteConfig.fetchAndActivate();

    // notificationRemoteConfig 키에서 JSON 데이터 가져오기
    final rawJson = remoteConfig.getString('notificationRemoteConfig');

    // JSON 데이터를 파싱하여 리스트로 변환
    final List<dynamic> parsedJson = jsonDecode(rawJson);

    // FlutterFlow Struct로 변환
    final List<NotificationRemoteConfigEachStruct> result =
        parsedJson.map((item) {
      return NotificationRemoteConfigEachStruct(
        imageUrl: item['imageUrl'] as String?,
        contentUrl: item['contentUrl'] as String?,
      );
    }).toList();

    return result;
  } catch (e) {
    // 에러 발생 시 빈 리스트 반환
    print('Error fetching Remote Config: $e');
    return [];
  }
}
