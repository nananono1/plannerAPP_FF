// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // jsonEncode 사용
import 'package:flutter/services.dart'; // MethodChannel 사용

Future<void> sendStudentInfoToManage(
  // FlutterFlow Action Flow에서 실행되는 Custom Action
  String displayName, // 학생명(display_name)
  String seatNo, // 좌석번호
  String spot, // 지점(spot)
  String school, // 학교
  WeeklyTimeTableStruct
      scheduleNow, // ✅ weeklyTimeTable 기반 Struct (프로젝트 실제 이름으로 맞추기)
) async {
  // ===== 1) scheduleNow(Struct) → JSON 문자열로 변환 =====

  Map<String, dynamic> outingToMap(DailyOutingStruct o) {
    // 외출 1개 변환
    return <String, dynamic>{
      // JSON 가능한 타입만 사용
      'reason': o.reason ?? '', // 외출 사유
      'outingstarttime_ms':
          o.outingstarttime?.millisecondsSinceEpoch ?? 0, // 시작(ms)
      'outingendtime_ms':
          o.outingendtime?.millisecondsSinceEpoch ?? 0, // 종료(ms)
      'color': o.color?.toString() ?? '', // Color는 문자열(표시용)
    };
  }

  Map<String, dynamic> dayToMap(DailyTimeTableFormatStruct d) {
    // 요일 1개 변환
    final outings = (d.dailyoutingList ?? <DailyOutingStruct>[]) // null 방지
        .map(outingToMap) // 외출 변환
        .toList(); // 리스트 확정

    return <String, dynamic>{
      'naegongStartTime_ms':
          d.naegongStartTime?.millisecondsSinceEpoch ?? 0, // 내공 시작(ms)
      'naegongEndTime_ms':
          d.naegongEndTime?.millisecondsSinceEpoch ?? 0, // 내공 종료(ms)
      'nonExistingDate': d.nonExistingDate ?? false, // 데이터 없음
      'dayNaegongColor': d.dayNaegongColor?.toString() ?? '', // 색상 문자열
      'dailyoutingList': outings, // 외출 리스트
    };
  }

  final Map<String, dynamic> scheduleMap = <String, dynamic>{
    // 최상위 Map
    'uid_path': scheduleNow.uid?.path ?? '', // DocRef → path 문자열
    'tablename': scheduleNow.tablename ?? '', // "4월"
    'updatedDate_ms':
        scheduleNow.updatedDate?.millisecondsSinceEpoch ?? 0, // 업데이트(ms)

    'mon': scheduleNow.mon != null
        ? dayToMap(scheduleNow.mon!)
        : <String, dynamic>{}, // 월
    'tue': scheduleNow.tue != null
        ? dayToMap(scheduleNow.tue!)
        : <String, dynamic>{}, // 화
    'wed': scheduleNow.wed != null
        ? dayToMap(scheduleNow.wed!)
        : <String, dynamic>{}, // 수
    'thu': scheduleNow.thu != null
        ? dayToMap(scheduleNow.thu!)
        : <String, dynamic>{}, // 목
    'fri': scheduleNow.fri != null
        ? dayToMap(scheduleNow.fri!)
        : <String, dynamic>{}, // 금
    'sat': scheduleNow.sat != null
        ? dayToMap(scheduleNow.sat!)
        : <String, dynamic>{}, // 토
    'sun': scheduleNow.sun != null
        ? dayToMap(scheduleNow.sun!)
        : <String, dynamic>{}, // 일
  };

  final String scheduleNowJson = jsonEncode(scheduleMap); // Map → JSON 문자열

  // ===== 2) MethodChannel로 안드로이드 네이티브에 전달 =====

  const MethodChannel channel =
      MethodChannel('com.naegongstudy.app/bridge'); // Kotlin과 동일 채널명

  await channel.invokeMethod(
    // 네이티브 함수 호출
    'sendStudentInfoToManage', // Kotlin에서 받을 method 이름
    <String, dynamic>{
      'display_name': displayName, // 학생명
      'seatNo': seatNo, // 좌석
      'spot': spot, // 지점
      'school': school, // 학교
      'scheduleNowJson': scheduleNowJson, // scheduleNow JSON 문자열
    },
  );
}
