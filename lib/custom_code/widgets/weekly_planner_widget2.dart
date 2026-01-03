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

import '/backend/backend.dart'; // // FF 백엔드 접근
import '/backend/schema/structs/index.dart'; // // Structs(WeeklyTimeTableStruct 등)
import '/backend/schema/enums/enums.dart'; // // Enums(필요 시)
import '/actions/actions.dart' as action_blocks; // // 커스텀 액션
import '/flutter_flow/flutter_flow_theme.dart'; // // 테마
import '/flutter_flow/flutter_flow_util.dart'; // // 유틸
import '/custom_code/widgets/index.dart'; // // 다른 커스텀 위젯
import '/custom_code/actions/index.dart'; // // 커스텀 액션
import '/flutter_flow/custom_functions.dart'; // // 커스텀 함수
import 'package:flutter/material.dart'; // // 기본 위젯

// ───────────────────────────────────────────────────────────
// 외부 패키지 임포트
// ───────────────────────────────────────────────────────────
import 'package:time_planner/time_planner.dart'; // // 시간표 UI 패키지

/// ─────────────────────────────────────────────────────────── 위젯 본체
/// ───────────────────────────────────────────────────────────
class WeeklyPlannerWidget2 extends StatefulWidget {
  const WeeklyPlannerWidget2({
    super.key, // // 플러터 Key
    this.width, // // 외부 지정 너비(옵션)
    this.height, // // 외부 지정 높이(옵션)
    this.pickedData, // // 주간 데이터(WeeklyTimeTableStruct)
  });

  final double? width; // // 위젯 너비
  final double? height; // // 위젯 높이
  final WeeklyTimeTableStruct? pickedData; // // 주간 시간표 데이터

  @override
  State<WeeklyPlannerWidget2> createState() =>
      _WeeklyPlannerWidget2State(); // // 상태 객체
}

class _WeeklyPlannerWidget2State extends State<WeeklyPlannerWidget2> {
  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 공백 문자열 체크 — 공동 유틸 없이 이 파일 내부에서만 사용
  // ───────────────────────────────────────────────────────
  bool _isBlank(String? s) =>
      s == null || s.trim().isEmpty; // // null 또는 trim 후 길이 0이면 true

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 자정 기준 분 환산 — 날짜는 무시하고 시/분만 사용
  // ───────────────────────────────────────────────────────
  int _minutesFromMidnight(DateTime t) =>
      t.hour * 60 + t.minute; // // 예: 09:00 → 540

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 새벽 컷(0~2시) → 23:59로 강제
  // ───────────────────────────────────────────────────────
  int _clampEndTo2359IfEarly(int endMin) =>
      (endMin <= 179) ? 1439 : endMin; // // 179=02:59, 1439=23:59

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 시/분만으로 duration 계산(음수 방지, 최소 1분)
  // ───────────────────────────────────────────────────────
  int _durationMinutes(DateTime start, DateTime end,
      {bool applyEarlyCut = true}) {
    final startMin = _minutesFromMidnight(start); // // 시작 시/분 → 분
    var endMin = _minutesFromMidnight(end); // // 종료 시/분 → 분
    if (applyEarlyCut) endMin = _clampEndTo2359IfEarly(endMin); // // 0~2시 컷 적용
    final d = endMin - startMin; // // 지속시간(분)
    return (d <= 0) ? 1 : d; // // 음수/0 방지 (최소 1분)
  }

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 12시간제 AM/PM 표기 — 화면 라벨용(계산과 무관)
  // ───────────────────────────────────────────────────────
  String _label12h(DateTime t) {
    final h = t.hour; // // 시
    final m = t.minute.toString().padLeft(2, '0'); // // 분(2자리)
    final suffix = h >= 12 ? 'PM' : 'AM'; // // AM/PM
    final hh = (h % 12 == 0) ? 12 : (h % 12); // // 0/12 보정
    return "$hh:$m $suffix"; // // 예: 9:00 AM
  }

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) “자율등원” 자동 블록 시간(고정)
  // ───────────────────────────────────────────────────────
  static const int _autoStartHour = 9; // // 09:00
  static const int _autoStartMin = 0;
  static const int _autoEndHour = 22; // // 22:10
  static const int _autoEndMin = 10;

  // ───────────────────────────────────────────────────────
  // (로컬 유틸) 카드 UI(상단 시간바 + 본문 텍스트)
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
              timeLabel, // // "h:mm AM/PM - h:mm AM/PM"
              style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.w600,
                color: Colors.black87, // // 작고 진한 글씨
              ),
            ),
          ),
          Container(height: 1, color: Colors.black12), // // 얇은 구분선
          Expanded(
            child: Container(
              width: double.infinity, // // 가로 가득
              padding: const EdgeInsets.all(8), // // 본문 패딩
              child: Text(
                bodyText, // // 본문 텍스트
                style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600,
                  color: Colors.black, // // 가독성 스타일
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
    // // TimePlanner를 사용해 그리드와 Task를 렌더링
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
      endHour: 23, // // y축 종료(23:00 라인까지)
      use24HourFormat: true, // // y축 24시간 표기
      setTimeOnAxis: true, // // y축 시간 라벨 ON
      style: TimePlannerStyle(
        cellHeight: 52, // // 셀 높이
        cellWidth: 78, // // 셀 너비(Widget3와 차별)
        dividerColor: Colors.grey.shade300, // // 그리드 색
        showScrollBar: false, // // 스크롤바 숨김
        backgroundColor: Colors.white, // // 배경색(흰색)
      ),
      tasks: _generateTasks(widget.pickedData), // // Task 목록
    );
  }

  // ───────────────────────────────────────────────────────
  // 주간 데이터 → TimePlannerTask 리스트 변환(날짜 무시/시·분만 계산)
  // ───────────────────────────────────────────────────────
  List<TimePlannerTask> _generateTasks(WeeklyTimeTableStruct? data) {
    if (data == null) return []; // // 데이터 없으면 빈 리스트

    final tasks = <TimePlannerTask>[]; // // 결과 리스트
    final dayIndex = <String, int>{
      // // 요일 → 열 인덱스
      "MON": 0, "TUE": 1, "WED": 2, "THU": 3, "FRI": 4, "SAT": 5, "SUN": 6,
    };

    dayIndex.forEach((dayName, day) {
      final d = _getDaily(data, dayName); // // 해당 요일 데이터
      if (d == null) return; // // 없으면 스킵

      // (1) nonExistingDate == true → 자율등원 09:00~22:10 한 블록만 생성
      if (d.nonExistingDate == true) {
        final autoStart =
            DateTime(2000, 1, 1, _autoStartHour, _autoStartMin); // // 09:00
        final autoEnd =
            DateTime(2000, 1, 1, _autoEndHour, _autoEndMin); // // 22:10
        tasks.add(
          TimePlannerTask(
            color: const Color(0xFFFFEFD6), // // 외출계열 색(연노랑)
            dateTime: TimePlannerDateTime(
              day: day, hour: autoStart.hour,
              minutes: autoStart.minute, // // 시작위치
            ),
            minutesDuration: _durationMinutes(autoStart, autoEnd), // // 시/분만 계산
            child: _buildCard(
              timeLabel:
                  "${_label12h(autoStart)} - ${_label12h(autoEnd)}", // // 라벨
              bodyText: "자율등원", // // 텍스트
            ),
          ),
        );
        return; // // 이 요일은 여기서 종료(다른 블록 생성 X)
      }

      // (2) 내공 블록(시작/종료 모두 있을 때만)
      if (d.naegongStartTime != null && d.naegongEndTime != null) {
        final s = d.naegongStartTime!; // // 시작 시각
        final e = d.naegongEndTime!; // // 종료 시각
        tasks.add(
          TimePlannerTask(
            color: const Color(0xFFD1E3FF), // // 내공 색(연하늘)
            dateTime: TimePlannerDateTime(
              day: day, hour: s.hour, minutes: s.minute, // // 시작 위치
            ),
            minutesDuration: _durationMinutes(s, e), // // 시/분만 계산(+새벽컷)
            child: _buildCard(
              timeLabel: "${_label12h(s)} - ${_label12h(e)}", // // 원본 시간 라벨
              bodyText: "내공", // // 본문
            ),
          ),
        );
      }

      // (3) 외출 리스트(각 항목 반복)
      for (final o in d.dailyoutingList) {
        if (o.outingstarttime != null && o.outingendtime != null) {
          final s = o.outingstarttime!; // // 외출 시작
          final e = o.outingendtime!; // // 외출 종료
          final text = _isBlank(o.reason) ? "외출" : o.reason!.trim(); // // 공란 보호
          tasks.add(
            TimePlannerTask(
              color: o.color ?? const Color(0xFFFFEFD6), // // 지정색 없으면 연노랑
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

    return tasks; // // 누적 결과 반환
  }

  // ───────────────────────────────────────────────────────
  // 요일 문자열 → 해당 요일 데이터 반환 스위치
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
