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

import 'package:syncfusion_flutter_charts/charts.dart';

class DailyPieChartBottom extends StatefulWidget {
  const DailyPieChartBottom({
    super.key,
    this.width,
    this.height,
    required this.pageStateSchema,
  });

  final double? width;
  final double? height;
  final PageStateSchemaStruct pageStateSchema;

  @override
  State<DailyPieChartBottom> createState() => _DailyPieChartBottomState();
}

class _DailyPieChartBottomState extends State<DailyPieChartBottom> {
  @override
  Widget build(BuildContext context) {
    // 각 과목별로 총 공부 시간을 계산하고 퍼센티지로 변환
    final studyData = _calculateStudyPercentages(widget.pageStateSchema);

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: widget.width ?? 400, // 차트 컨테이너 너비를 늘림
        height: widget.height ?? 500, // 차트 컨테이너 높이를 늘림
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              '일일학습편향차트',
              style: TextStyle(
                fontSize: 15, // 원래 크기 유지
                fontWeight: FontWeight.bold,
                fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            const SizedBox(height: 15), // 제목과 차트 간 간격
            Expanded(
              child: SfCircularChart(
                legend: Legend(
                  isVisible: true,
                  alignment: ChartAlignment.center,
                  position: LegendPosition.bottom,
                  textStyle: TextStyle(
                    fontSize: 12, // 원래 크기 유지
                    fontFamily:
                        FlutterFlowTheme.of(context).bodyText1.fontFamily,
                    color: FlutterFlowTheme.of(context).bodyText1.color,
                  ),
                  overflowMode: LegendItemOverflowMode.wrap,
                  padding: 10, // 범례와 차트 사이의 간격 조정
                  itemPadding: 5, // 범례 항목 간의 간격 조정
                  legendItemBuilder:
                      (String name, dynamic series, dynamic point, int index) {
                    final subjectName = studyData[index]['subjectName'];
                    final percentage = studyData[index]['percentage'];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: studyData[index]['pickedColor'],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '$subjectName (${percentage.toStringAsFixed(1)}%)',
                          style: TextStyle(
                            fontSize: 10, // 원래 크기 유지
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyText1
                                .fontFamily,
                            color: FlutterFlowTheme.of(context).bodyText1.color,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                backgroundColor: Colors.transparent,
                series: <CircularSeries>[
                  PieSeries<Map<String, dynamic>, String>(
                    dataSource: studyData,
                    xValueMapper: (data, _) => data['subjectName'],
                    yValueMapper: (data, _) => data['percentage'],
                    pointColorMapper: (data, _) => data['pickedColor'],
                    radius: '100%', // 차트 반지름 크기 유지
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.inside,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12, // 원래 크기 유지
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

  // 각 과목의 총 공부 시간을 퍼센티지로 변환하는 함수
  List<Map<String, dynamic>> _calculateStudyPercentages(
      PageStateSchemaStruct pageStateSchema) {
    Map<String, double> subjectTimeMap = {};
    Map<String, Color> subjectColorMap = {};
    double totalStudyTime = 0.0;

    for (var plannerInput in pageStateSchema.inputListState) {
      String subjectName = plannerInput.subjectNamePlanner ?? "Unknown";
      List<DateTime>? startTimeList = plannerInput.studyStartTime ?? [];
      List<DateTime>? endTimeList = plannerInput.studyEndTime ?? [];

      if (!subjectColorMap.containsKey(subjectName)) {
        subjectColorMap[subjectName] = plannerInput.pickedColor ?? Colors.grey;
      }

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
