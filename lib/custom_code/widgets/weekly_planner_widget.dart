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

import 'package:time_planner/time_planner.dart';

class WeeklyPlannerWidget extends StatefulWidget {
  const WeeklyPlannerWidget({
    super.key,
    this.width,
    this.height,
    this.pickedData,
  });

  final double? width;
  final double? height;
  final WeeklyTimeTableStruct? pickedData;

  @override
  State<WeeklyPlannerWidget> createState() => _WeeklyPlannerWidgetState();
}

class _WeeklyPlannerWidgetState extends State<WeeklyPlannerWidget> {
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
      endHour: 23,
      use24HourFormat: true,
      setTimeOnAxis: true,
      style: TimePlannerStyle(
        cellHeight: 56,
        cellWidth: 80,
        dividerColor: Colors.grey.shade300,
        showScrollBar: true,
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

      // 내공
      if (dailyData.nonExistingDate != true &&
          dailyData.naegongStartTime != null &&
          dailyData.naegongEndTime != null) {
        tasks.add(
          TimePlannerTask(
            color: const Color(0xFFCCE3FF),
            dateTime: TimePlannerDateTime(
              day: dayIndex,
              hour: dailyData.naegongStartTime!.hour,
              minutes: dailyData.naegongStartTime!.minute,
            ),
            minutesDuration: dailyData.naegongEndTime!
                .difference(dailyData.naegongStartTime!)
                .inMinutes,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _formatTime(dailyData.naegongStartTime!),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "내공",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      // 외출
      for (final outing in dailyData.dailyoutingList) {
        if (outing.outingstarttime != null && outing.outingendtime != null) {
          tasks.add(
            TimePlannerTask(
              color: outing.color ?? const Color(0xFFFEE1E8),
              dateTime: TimePlannerDateTime(
                day: dayIndex,
                hour: outing.outingstarttime!.hour,
                minutes: outing.outingstarttime!.minute,
              ),
              minutesDuration: outing.outingendtime!
                  .difference(outing.outingstarttime!)
                  .inMinutes,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatTime(outing.outingstarttime!),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      outing.reason ?? "외출",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black,
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
    final suffix = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return "$displayHour:$minute $suffix";
  }
}
