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
import 'package:intl/intl.dart'; // 날짜 형식 포맷을 위한 패키지

class CumulativeLineChartWeekly extends StatefulWidget {
  const CumulativeLineChartWeekly({
    super.key,
    this.width,
    this.height,
    required this.insideDBStudent,
  });

  final double? width;
  final double? height;
  final List<PageStateSchemaStruct> insideDBStudent;

  @override
  State<CumulativeLineChartWeekly> createState() =>
      _CumulativeLineChartWeeklyState();
}

class _CumulativeLineChartWeeklyState extends State<CumulativeLineChartWeekly> {
  @override
  Widget build(BuildContext context) {
    // 기준일로부터 1주간의 데이터를 필터링
    final DateTime endDate = DateTime.now();
    final DateTime startDate = endDate.subtract(Duration(days: 7));

    // 1주일간의 공부 데이터를 필터링
    final filteredData = widget.insideDBStudent.where((pageState) {
      final submittedDate = pageState.submittedDatePlanner;
      return submittedDate != null &&
          submittedDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          submittedDate.isBefore(endDate.add(Duration(days: 1)));
    }).toList();

    // 각 날짜별로 공부 시간을 누적
    final cumulativeData =
        _calculateCumulativeStudyHours(startDate, endDate, filteredData);

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 400.0,
      child: SfCartesianChart(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        title: ChartTitle(text: 'Cumulative Study Hours (Last 7 Days)'),
        legend: Legend(isVisible: true),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Study Hours')), // y축: 공부 시간 (시간 단위)
        tooltipBehavior: TooltipBehavior(enable: true), // 툴팁 사용 설정
        series: _buildLineSeries(cumulativeData),
      ),
    );
  }

  // 공부 데이터를 처리하여 날짜별 누적 시간을 계산하는 함수
  List<LineSeries<Map<String, dynamic>, String>> _buildLineSeries(
      Map<String, List<Map<String, dynamic>>> cumulativeData) {
    return cumulativeData.entries.map((entry) {
      return LineSeries<Map<String, dynamic>, String>(
        name: entry.key, // 과목 이름
        dataSource: entry.value, // 날짜별 누적 데이터
        xValueMapper: (data, _) => data['date'], // x축: 날짜
        yValueMapper: (data, _) => data['cumulativeHours'], // y축: 누적 공부 시간
        markerSettings: MarkerSettings(isVisible: true), // 마커 표시
        dataLabelSettings: DataLabelSettings(isVisible: true), // 데이터 라벨 표시
      );
    }).toList();
  }

  // 각 과목별로 날짜별 공부 시간을 누적하는 함수
  Map<String, List<Map<String, dynamic>>> _calculateCumulativeStudyHours(
      DateTime startDate,
      DateTime endDate,
      List<PageStateSchemaStruct> filteredData) {
    Map<String, List<Map<String, dynamic>>> cumulativeData = {};
    Map<String, double> subjectTotalHours = {};

    // 기준일로부터 1주일간의 날짜 리스트 생성 (MM/dd 형식으로 변경)
    List<String> dateRange = List.generate(
      endDate.difference(startDate).inDays + 1,
      (i) => DateFormat('MM/dd').format(startDate.add(Duration(days: i))),
    );

    // 각 날짜에 대해 과목별 공부 시간을 0으로 초기화
    for (String date in dateRange) {
      for (var subjectName in filteredData
          .expand((page) =>
              page.inputListState
                  ?.map((input) => input.subjectNamePlanner)
                  .toSet() ??
              {})
          .toSet()) {
        cumulativeData.putIfAbsent(subjectName ?? "Unknown", () => []);
        cumulativeData[subjectName]!.add({
          'date': date,
          'cumulativeHours': subjectTotalHours[subjectName] ?? 0.0, // 공부 시간 누적
        });
      }
    }

    // 필터된 데이터 기반으로 실제 공부 시간을 누적
    for (var pageState in filteredData) {
      String? date = pageState.submittedDatePlanner != null
          ? DateFormat('MM/dd').format(pageState.submittedDatePlanner!)
          : null;
      List<PlannerInputStruct> inputList = pageState.inputListState ?? [];

      for (var plannerInput in inputList) {
        String subjectName = plannerInput.subjectNamePlanner ?? "Unknown";
        List<DateTime>? startTimes = plannerInput.studyStartTime;
        List<DateTime>? endTimes = plannerInput.studyEndTime;

        if (startTimes != null &&
            endTimes != null &&
            startTimes.isNotEmpty &&
            endTimes.isNotEmpty) {
          double dailyStudyHours = 0;

          for (int i = 0; i < startTimes.length; i++) {
            final studyStart = startTimes[i];
            final studyEnd = endTimes[i];
            final duration = studyEnd.difference(studyStart).inMinutes /
                60.0; // 시간을 시간 단위로 계산
            dailyStudyHours += duration;
          }

          subjectTotalHours[subjectName] =
              (subjectTotalHours[subjectName] ?? 0) + dailyStudyHours;

          // 누적 데이터를 저장
          if (date != null) {
            cumulativeData[subjectName]!
                .removeWhere((data) => data['date'] == date);
            cumulativeData[subjectName]!.add({
              'date': date,
              'cumulativeHours': subjectTotalHours[subjectName],
            });
          }
        }
      }
    }

    return cumulativeData;
  }
}
