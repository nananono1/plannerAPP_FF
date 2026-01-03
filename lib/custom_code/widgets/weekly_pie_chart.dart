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

import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyPieChart extends StatefulWidget {
  const WeeklyPieChart({
    super.key,
    this.width,
    this.height,
    required this.pageStateSchemaList,
    this.startDate, // 시작 날짜
    this.endDate, // 종료 날짜
  });

  final double? width;
  final double? height;
  final List<PageStateSchemaStruct> pageStateSchemaList;
  final DateTime? startDate; // 시작 날짜
  final DateTime? endDate; // 종료 날짜

  @override
  State<WeeklyPieChart> createState() => _WeeklyPieChartState();
}

class _WeeklyPieChartState extends State<WeeklyPieChart> {
  @override
  Widget build(BuildContext context) {
    // 날짜 범위에 따라 데이터를 필터링하고 퍼센티지 계산
    final studyData = _calculateWeeklyStudyPercentages(
      widget.pageStateSchemaList,
      widget.startDate,
      widget.endDate,
    );

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: widget.width ?? 400,
        height: widget.height ?? 500,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              '주간학습편향차트',
              style: TextStyle(
                fontSize: 15,
                fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: SfCircularChart(
                legend: Legend(
                  isVisible: true,
                  alignment: ChartAlignment.center,
                  position: LegendPosition.right,
                  textStyle: TextStyle(
                    fontSize: 11,
                    fontFamily:
                        FlutterFlowTheme.of(context).bodyText1.fontFamily,
                    color: FlutterFlowTheme.of(context).bodyText1.color,
                  ),
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                backgroundColor: Colors.transparent,
                series: <CircularSeries>[
                  PieSeries<Map<String, dynamic>, String>(
                    dataSource: studyData,
                    xValueMapper: (data, _) => data['subjectName'],
                    yValueMapper: (data, _) => data['percentage'],
                    pointColorMapper: (data, _) => data['pickedColor'],
                    radius: '110%',
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.inside,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1.fontFamily,
                      ),
                    ),
                    enableTooltip: true,
                    dataLabelMapper: (data, _) =>
                        '${data['subjectName']}, ${data['percentage'].toStringAsFixed(1)}%',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 특정 날짜 범위 내 데이터를 합산하여 퍼센티지 계산
  List<Map<String, dynamic>> _calculateWeeklyStudyPercentages(
      List<PageStateSchemaStruct> pageStateSchemaList,
      DateTime? startDate,
      DateTime? endDate) {
    // 기본 날짜 범위 설정
    final DateTime calculatedStartDate =
        startDate ?? DateTime.now().subtract(Duration(days: 6));
    final DateTime calculatedEndDate = endDate ?? DateTime.now();

    // `submittedDatePlanner` 기준으로 필터링
    final filteredPageStateSchemaList = pageStateSchemaList.where((pageState) {
      final submittedDate = pageState.submittedDatePlanner;
      return submittedDate != null &&
          submittedDate
              .isAfter(calculatedStartDate.subtract(Duration(days: 1))) &&
          submittedDate.isBefore(calculatedEndDate.add(Duration(days: 1)));
    }).toList();

    Map<String, double> subjectTimeMap = {};
    Map<String, Color> subjectColorMap = {};
    double totalStudyTime = 0.0;

    // 필터링된 데이터 순회
    for (var pageStateSchema in filteredPageStateSchemaList) {
      for (var plannerInput in pageStateSchema.inputListState) {
        String subjectName = plannerInput.subjectNamePlanner ?? "Unknown";
        List<DateTime>? startTimeList = plannerInput.studyStartTime ?? [];
        List<DateTime>? endTimeList = plannerInput.studyEndTime ?? [];

        // 색상 매핑
        if (!subjectColorMap.containsKey(subjectName)) {
          subjectColorMap[subjectName] =
              plannerInput.pickedColor ?? Colors.grey;
        }

        // 학습 시간 계산
        if (startTimeList.isNotEmpty && endTimeList.isNotEmpty) {
          for (int i = 0; i < startTimeList.length; i++) {
            DateTime startTime = startTimeList[i];
            DateTime endTime = endTimeList[i];
            double studySeconds =
                endTime.difference(startTime).inSeconds.toDouble();

            if (subjectTimeMap.containsKey(subjectName)) {
              subjectTimeMap[subjectName] =
                  subjectTimeMap[subjectName]! + studySeconds;
            } else {
              subjectTimeMap[subjectName] = studySeconds;
            }

            totalStudyTime += studySeconds;
          }
        }
      }
    }

    // 데이터가 없는 경우 빈 리스트 반환
    if (totalStudyTime == 0.0) {
      return [];
    }

    // 퍼센티지 계산 및 반환
    return subjectTimeMap.entries.map((entry) {
      double percentage = (entry.value / totalStudyTime) * 100;

      return {
        'subjectName': entry.key,
        'percentage': percentage,
        'pickedColor': subjectColorMap[entry.key],
      };
    }).toList();
  }
}
