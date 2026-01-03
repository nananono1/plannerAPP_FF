// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:time_planner/time_planner.dart'; // // 시간표 UI 패키지

class WeeklyPlannerWidget3 extends StatefulWidget {
  const WeeklyPlannerWidget3({
    super.key, // // Key
    this.width, // // 너비(옵션)
    this.height, // // 높이(옵션)
    this.pickedData, // // 주간 데이터
  });

  final double? width; // // 위젯 너비
  final double? height; // // 위젯 높이
  final WeeklyTimeTableStruct? pickedData; // // 주간 시간표 데이터

  @override
  State<WeeklyPlannerWidget3> createState() =>
      _WeeklyPlannerWidget3State(); // // 상태
}

class _WeeklyPlannerWidget3State extends State<WeeklyPlannerWidget3> {
  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 공백 문자열 체크
  // ───────────────────────────────────────────────────────
  bool _isBlank(String? s) => s == null || s.trim().isEmpty; // // null/공백 판단

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 자정 기준 분 환산
  // ───────────────────────────────────────────────────────
  int _minutesFromMidnight(DateTime t) => t.hour * 60 + t.minute; // // 시·분만 사용

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 새벽 컷(0~2시) → 23:59로 강제
  // ───────────────────────────────────────────────────────
  int _clampEndTo2359IfEarly(int endMin) =>
      (endMin <= 179) ? 1439 : endMin; // // 179=02:59

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 시/분만으로 duration 계산(음수 방지, 최소 1분)
  // ───────────────────────────────────────────────────────
  int _durationMinutes(DateTime start, DateTime end,
      {bool applyEarlyCut = true}) {
    final startMin = _minutesFromMidnight(start); // // 시작 분
    var endMin = _minutesFromMidnight(end); // // 종료 분
    if (applyEarlyCut) endMin = _clampEndTo2359IfEarly(endMin); // // 새벽 컷
    final d = endMin - startMin; // // 차이
    return (d <= 0) ? 1 : d; // // 최소 1분
  }

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 12시간제 라벨
  // ───────────────────────────────────────────────────────
  String _label12h(DateTime t) {
    final h = t.hour; // // 시
    final m = t.minute.toString().padLeft(2, '0'); // // 분
    final suffix = h >= 12 ? 'PM' : 'AM'; // // AM/PM
    final hh = (h % 12 == 0) ? 12 : (h % 12); // // 0/12 보정
    return "$hh:$m $suffix"; // // 예: 9:00 AM
  }

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) “자율등원” 자동 블록 표준시각
  // ───────────────────────────────────────────────────────
  static const int _autoStartHour = 9; // // 09:00
  static const int _autoStartMin = 0;
  static const int _autoEndHour = 22; // // 22:10
  static const int _autoEndMin = 10;

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 카드 UI
  // ───────────────────────────────────────────────────────
  Widget _buildCard({required String timeLabel, required String bodyText}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8), // // 둥근 모서리
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // // 좌측 정렬
        children: [
          Container(
            width: double.infinity, // // 가로 가득
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 4), // // 상단 바 패딩
            color: Colors.white.withOpacity(0.3), // // 엷은 배경
            child: Text(
              timeLabel, // // 상단 시간 라벨
              style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.w600,
                color: Colors.black87, // // 스타일
              ),
            ),
          ),
          Container(height: 1, color: Colors.black12), // // 구분선
          Expanded(
            child: Container(
              width: double.infinity, // // 가로 가득
              padding: const EdgeInsets.all(8), // // 본문 패딩
              child: Text(
                bodyText, // // 본문 텍스트
                style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600,
                  color: Colors.black, // // 스타일
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // // TimePlanner로 그리드 + Task 렌더
    return TimePlanner(
      headers: const [
        TimePlannerTitle(title: ' MON '), // // 월
        TimePlannerTitle(title: ' TUE '), // // 화
        TimePlannerTitle(title: ' WED '), // // 수
        TimePlannerTitle(title: ' THU '), // // 목
        TimePlannerTitle(title: ' FRI '), // // 금
        TimePlannerTitle(title: ' SAT '), // // 토
        TimePlannerTitle(title: ' SUN '), // // 일
      ],
      startHour: 8, // // y축 시작(08:00)
      endHour: 23, // // y축 종료(23:00)
      use24HourFormat: true, // // y축 24시간 표기
      setTimeOnAxis: true, // // y축 시간 라벨 ON
      style: TimePlannerStyle(
        cellHeight: 52, // // 셀 높이
        cellWidth: 72, // // 셀 너비(Widget2보다 약간 좁게)
        dividerColor: Colors.grey.shade300, // // 그리드 색
        showScrollBar: false, // // 스크롤바 숨김
        backgroundColor: Colors.white, // // 배경
      ),
      tasks: _generateTasks(widget.pickedData), // // Task 목록
    );
  }

  // ───────────────────────────────────────────────────────
  // 주간 데이터 → TimePlannerTask 리스트 변환(날짜 무시/시·분만 계산)
  // ───────────────────────────────────────────────────────
  List<TimePlannerTask> _generateTasks(WeeklyTimeTableStruct? data) {
    if (data == null) return []; // // 데이터 없으면 빈 리스트

    final tasks = <TimePlannerTask>[]; // // 결과 누적
    final dayIndex = <String, int>{
      // // 요일 → 열 인덱스
      "MON": 0, "TUE": 1, "WED": 2, "THU": 3, "FRI": 4, "SAT": 5, "SUN": 6,
    };

    dayIndex.forEach((dayName, day) {
      final d = _getDaily(data, dayName); // // 해당 요일 데이터
      if (d == null) return; // // 없으면 스킵

      // (1) nonExistingDate == true → 09:00~22:10 "자율등원" 1개만 표시
      if (d.nonExistingDate == true) {
        final autoStart =
            DateTime(2000, 1, 1, _autoStartHour, _autoStartMin); // // 09:00
        final autoEnd =
            DateTime(2000, 1, 1, _autoEndHour, _autoEndMin); // // 22:10
        tasks.add(
          TimePlannerTask(
            color: const Color(0xFFFFEFD6), // // 외출계열(연노랑)
            dateTime: TimePlannerDateTime(
              day: day, hour: autoStart.hour,
              minutes: autoStart.minute, // // 시작 위치
            ),
            minutesDuration: _durationMinutes(autoStart, autoEnd), // // 시/분만 계산
            child: _buildCard(
              timeLabel:
                  "${_label12h(autoStart)} - ${_label12h(autoEnd)}", // // 카드 라벨
              bodyText: "자율등원", // // 본문
            ),
          ),
        );
        return; // // 이 요일은 여기서 종료
      }

      // (2) 내공(시작/종료 존재 시)
      if (d.naegongStartTime != null && d.naegongEndTime != null) {
        final s = d.naegongStartTime!; // // 시작
        final e = d.naegongEndTime!; // // 종료
        tasks.add(
          TimePlannerTask(
            color: const Color(0xFFD1E3FF), // // 내공(연하늘)
            dateTime: TimePlannerDateTime(
              day: day, hour: s.hour, minutes: s.minute, // // 시작 위치
            ),
            minutesDuration: _durationMinutes(s, e), // // 시/분만 계산(+새벽컷)
            child: _buildCard(
              timeLabel: "${_label12h(s)} - ${_label12h(e)}", // // 라벨
              bodyText: "내공", // // 본문
            ),
          ),
        );
      }

      // (3) 외출(각 항목 반복)
      for (final o in d.dailyoutingList) {
        if (o.outingstarttime != null && o.outingendtime != null) {
          final s = o.outingstarttime!; // // 외출 시작
          final e = o.outingendtime!; // // 외출 종료
          final text = _isBlank(o.reason) ? "외출" : o.reason!.trim(); // // 공란 보호
          tasks.add(
            TimePlannerTask(
              color: o.color ?? const Color(0xFFFFEFD6), // // 지정 없으면 연노랑
              dateTime: TimePlannerDateTime(
                day: day, hour: s.hour, minutes: s.minute, // // 시작 위치
              ),
              minutesDuration: _durationMinutes(s, e), // // 시/분만 계산
              child: _buildCard(
                timeLabel: "${_label12h(s)} - ${_label12h(e)}", // // 라벨
                bodyText: text, // // 사유
              ),
            ),
          );
        }
      }
    });

    return tasks; // // 결과 반환
  }

  // ───────────────────────────────────────────────────────
  // 요일 문자열 → 해당 요일 데이터 반환
  // ───────────────────────────────────────────────────────
  DailyTimeTableFormatStruct? _getDaily(WeeklyTimeTableStruct w, String name) {
    switch (name) {
      case "MON":
        return w.mon;
      case "TUE":
        return w.tue;
      case "WED":
        return w.wed;
      case "THU":
        return w.thu;
      case "FRI":
        return w.fri;
      case "SAT":
        return w.sat;
      case "SUN":
        return w.sun;
    }
    return null; // // 매칭 실패 시 null
  }
}
