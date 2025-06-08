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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// flutterLocalNotificationsPlugin 전역 선언 및 초기화
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// 초기화 함수
Future<void> initializeNotifications() async {
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher'); // 앱 아이콘 설정

  const InitializationSettings initializationSettings =
      InitializationSettings(android: androidInitializationSettings);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showCallNotification(String seatNumber, String callReason) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'call_channel', // 채널 ID
    'Call Notifications', // 채널 이름
    channelDescription: 'Notifications for call requests', // 채널 설명
    importance: Importance.max, // 중요도 설정
    priority: Priority.high, // 우선순위 설정
    ticker: 'ticker',
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  // 알림 생성
  await flutterLocalNotificationsPlugin.show(
    0, // 알림 ID
    'Call Request', // 알림 제목
    'Seat $seatNumber: $callReason', // 알림 내용
    notificationDetails,
    payload: 'call_payload', // 선택적으로 페이로드 추가
  );
}
