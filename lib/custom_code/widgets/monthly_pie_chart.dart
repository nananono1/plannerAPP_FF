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

import 'package:syncfusion_flutter_charts/charts.dart'; // Syncfusion 차트 패키지
import '/flutter_flow/flutter_flow_theme.dart'; // FlutterFlow 테마

class MonthlyPieChart extends StatefulWidget {
  const MonthlyPieChart({
    super.key,
    this.width,
    this.height,
    required this.pageStateSchema,
  });

  final double? width;
  final double? height;
  final List<PageStateSchemaStruct> pageStateSchema; // 리스트 형태의 입력값

  @override
  State<MonthlyPieChart> createState() => _MonthlyPieChartState();
}

class _MonthlyPieChartState extends State<MonthlyPieChart> {
  @override
  Widget build(BuildContext context) {
    // 각 과목별로 월간 공부 시간을 계산하고 퍼센티지로 변환
    final monthlyStudyData =
        _calculateMonthlyStudyPercentages(widget.pageStateSchema);

    return Align(
      alignment: Alignment(0.0, -0.9), // Y축 기준 위쪽으로 배치
      child: Container(
        width: widget.width ?? 260, // 차트 너비 설정
        height: widget.height ?? 260, // 차트 높이 설정
        decoration: BoxDecoration(
          color: Colors.transparent, // 상위 컨테이너 배경 투명으로 설정
          borderRadius: BorderRadius.circular(30), // 모서리를 둥글게 설정
        ),
        child: SfCircularChart(
          legend: Legend(isVisible: true), // 범례 표시
          backgroundColor: Colors.transparent, // 차트 배경 투명 설정
          series: <CircularSeries>[
            PieSeries<Map<String, dynamic>, String>(
              dataSource: monthlyStudyData,
              xValueMapper: (data, _) => data['subjectName'], // 과목 이름
              yValueMapper: (data, _) => data['percentage'], // 퍼센티지로 변환된 공부 시간
              pointColorMapper: (data, _) => data['pickedColor'], // 과목별 색상
              radius: '90%', // 차트 비율 설정
              dataLabelSettings: DataLabelSettings(
                isVisible: true, // 데이터 라벨 표시
                labelPosition: ChartDataLabelPosition.inside, // 라벨을 내부에 표시
                textStyle: TextStyle(
                  color: Colors.black, // 라벨 텍스트 색상
                  fontSize: 12, // 라벨 텍스트 크기
                ),
              ),
              enableTooltip: true, // 툴팁 유지
              dataLabelMapper: (data, _) => data['subjectName'], // 과목명 표시
            ),
          ],
        ),
      ),
    );
  }

  // 월간 공부 시간을 계산하고 퍼센티지로 변환하는 함수
  List<Map<String, dynamic>> _calculateMonthlyStudyPercentages(
      List<PageStateSchemaStruct> pageStateSchemaList) {
    Map<String, double> subjectTimeMap = {};
    Map<String, Color> subjectColorMap = {}; // 각 과목의 색상 저장
    double totalStudyTime = 0.0;

    // 각 페이지 스키마 리스트를 처리
    for (var pageStateSchema in pageStateSchemaList) {
      for (var plannerInput in pageStateSchema.inputListState) {
        String subjectName =
            plannerInput.subjectNamePlanner ?? "Unknown"; // 과목 이름
        List<DateTime>? startTimeList =
            plannerInput.studyStartTime ?? []; // 시작 시간 리스트
        List<DateTime>? endTimeList =
            plannerInput.studyEndTime ?? []; // 종료 시간 리스트

        // 과목의 색상은 처음 등장한 plannerInput의 pickedColor로 설정
        if (!subjectColorMap.containsKey(subjectName)) {
          subjectColorMap[subjectName] =
              plannerInput.pickedColor ?? Colors.grey;
        }

        // 시작 시간과 종료 시간이 제대로 있는 경우에만 계산
        if (startTimeList.isNotEmpty && endTimeList.isNotEmpty) {
          for (int i = 0; i < startTimeList.length; i++) {
            DateTime startTime = startTimeList[i];
            DateTime endTime = endTimeList[i];

            // 월간 데이터만 필터링
            if (_isWithinThisMonth(startTime)) {
              double studySeconds = endTime
                  .difference(startTime)
                  .inSeconds
                  .toDouble(); // 공부 시간 계산

              // 과목별로 공부 시간을 누적 (동일한 과목이 여러 번 나올 수 있음)
              if (subjectTimeMap.containsKey(subjectName)) {
                subjectTimeMap[subjectName] =
                    subjectTimeMap[subjectName]! + studySeconds;
              } else {
                subjectTimeMap[subjectName] = studySeconds;
              }

              totalStudyTime += studySeconds; // 전체 공부 시간 누적
            }
          }
        }
      }
    }

    // 과목별 공부 시간을 퍼센티지로 변환하여 리스트로 반환
    return subjectTimeMap.entries.map((entry) {
      double percentage = (entry.value / totalStudyTime) * 100;

      return {
        'subjectName': entry.key,
        'percentage': percentage, // 퍼센티지 값
        'pickedColor': subjectColorMap[entry.key], // 과목의 색상
      };
    }).toList();
  }

  // 주어진 날짜가 이번 달에 포함되는지 확인하는 함수
  bool _isWithinThisMonth(DateTime date) {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1); // 이번 달 1일
    final endOfMonth = DateTime(now.year, now.month + 1, 0); // 이번 달 마지막 날

    return date.isAfter(startOfMonth) && date.isBefore(endOfMonth);
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
