// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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

import 'package:time_planner/time_planner.dart';

class WeeklyPlannerWidget2 extends StatefulWidget {
  const WeeklyPlannerWidget2({
    super.key,
    this.width,
    this.height,
    this.pickedData,
  });

  final double? width;
  final double? height;
  final WeeklyTimeTableStruct? pickedData;

  @override
  State<WeeklyPlannerWidget2> createState() => _WeeklyPlannerWidget2State();
}

class _WeeklyPlannerWidget2State extends State<WeeklyPlannerWidget2> {
  @override
  Widget build(BuildContext context) {
    return TimePlanner(
      headers: const [
        TimePlannerTitle(title: ' MON '),
        TimePlannerTitle(title: ' TUE '),
        TimePlannerTitle(title: ' WED '),
        TimePlannerTitle(title: ' THU '),
        TimePlannerTitle(title: ' FRI '),
        TimePlannerTitle(title: ' SAT '),
        TimePlannerTitle(title: ' SUN '),
      ],
      startHour: 8,
      endHour: 23, // 23시까지만 y축 생성
      use24HourFormat: true,
      setTimeOnAxis: true,
      style: TimePlannerStyle(
        cellHeight: 52,
        cellWidth: 78,
        dividerColor: Colors.grey.shade300,
        showScrollBar: false,
        backgroundColor: Colors.white,
      ),
      tasks: _generateTasks(widget.pickedData),
    );
  }

  List<TimePlannerTask> _generateTasks(WeeklyTimeTableStruct? data) {
    if (data == null) return [];

    List<TimePlannerTask> tasks = [];

    final dayMapping = {
      "MON": 0,
      "TUE": 1,
      "WED": 2,
      "THU": 3,
      "FRI": 4,
      "SAT": 5,
      "SUN": 6,
    };

    dayMapping.forEach((dayName, dayIndex) {
      final dailyData = _getDailyData(data, dayName);
      if (dailyData == null) return;

      // 내공 처리
      if (dailyData.nonExistingDate != true &&
          dailyData.naegongStartTime != null &&
          dailyData.naegongEndTime != null) {
        final adjustedEndTime = _limitEndTime(dailyData.naegongEndTime!);
        tasks.add(
          TimePlannerTask(
            color: const Color(0xFFD1E3FF),
            dateTime: TimePlannerDateTime(
              day: dayIndex,
              hour: dailyData.naegongStartTime!.hour,
              minutes: dailyData.naegongStartTime!.minute,
            ),
            minutesDuration: adjustedEndTime
                .difference(dailyData.naegongStartTime!)
                .inMinutes,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.white.withOpacity(0.3),
                    child: Text(
                      "${_formatTime(dailyData.naegongStartTime!)} - ${_formatTime(dailyData.naegongEndTime!)}", // ⭐ 텍스트는 원본 시간
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.shade400.withOpacity(0.3),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "내공",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      // 외출 처리
      for (final outing in dailyData.dailyoutingList) {
        if (outing.outingstarttime != null && outing.outingendtime != null) {
          final adjustedOutingEndTime = _limitEndTime(outing.outingendtime!);
          tasks.add(
            TimePlannerTask(
              color: outing.color ?? const Color(0xFFFFEFD6),
              dateTime: TimePlannerDateTime(
                day: dayIndex,
                hour: outing.outingstarttime!.hour,
                minutes: outing.outingstarttime!.minute,
              ),
              minutesDuration: adjustedOutingEndTime
                  .difference(outing.outingstarttime!)
                  .inMinutes,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      color: Colors.white.withOpacity(0.3),
                      child: Text(
                        "${_formatTime(outing.outingstarttime!)} - ${_formatTime(outing.outingendtime!)}", // ⭐ 텍스트는 원본 시간
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade400.withOpacity(0.3),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          outing.reason ?? "외출",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    });

    return tasks;
  }

  DailyTimeTableFormatStruct? _getDailyData(
      WeeklyTimeTableStruct data, String dayName) {
    switch (dayName) {
      case "MON":
        return data.mon;
      case "TUE":
        return data.tue;
      case "WED":
        return data.wed;
      case "THU":
        return data.thu;
      case "FRI":
        return data.fri;
      case "SAT":
        return data.sat;
      case "SUN":
        return data.sun;
      default:
        return null;
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');

    final suffix = hour >= 12 ? 'PM' : 'AM'; // 오전/오후 구분
    final displayHour = hour % 12 == 0 ? 12 : hour % 12; // 12시간제로 변환
    return "$displayHour:$minute $suffix";
  }

  DateTime _limitEndTime(DateTime originalEndTime) {
    // 새벽 0~2시만 잘라서 23:59로 제한
    if (originalEndTime.hour >= 0 && originalEndTime.hour < 3) {
      return DateTime(
        originalEndTime.year,
        originalEndTime.month,
        originalEndTime.day,
        23,
        59,
      );
    }
    // 그 외는 원래 종료 시간 그대로
    return originalEndTime;
  }
}
