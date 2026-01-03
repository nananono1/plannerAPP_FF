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
import 'package:intl/intl.dart'; // 날짜 포맷팅을 위한 패키지

class WeeklyLineChart extends StatefulWidget {
  const WeeklyLineChart({
    super.key,
    this.width,
    this.height,
    required this.insideDBStudent,
    this.startDate, // 시작 날짜 (선택적 입력값)
    this.endDate, // 종료 날짜 (선택적 입력값)
  });

  final double? width;
  final double? height;
  final List<PageStateSchemaStruct> insideDBStudent;
  final DateTime? startDate; // 선택적 시작 날짜
  final DateTime? endDate; // 종료 날짜

  @override
  State<WeeklyLineChart> createState() => _WeeklyLineChartState();
}

class _WeeklyLineChartState extends State<WeeklyLineChart> {
  @override
  Widget build(BuildContext context) {
    // 입력값으로 받은 startDate와 endDate, 없으면 기본값 설정
    final DateTime endDate = widget.endDate ?? DateTime.now();
    final DateTime startDate =
        widget.startDate ?? endDate.subtract(Duration(days: 6));

    // 데이터를 필터링 및 정렬
    final filteredData = widget.insideDBStudent.where((pageState) {
      final submittedDate = pageState.submittedDatePlanner;
      return submittedDate != null &&
          submittedDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          submittedDate.isBefore(endDate.add(Duration(days: 1)));
    }).toList()
      ..sort((a, b) =>
          a.submittedDatePlanner!.compareTo(b.submittedDatePlanner!)); // 날짜 정렬

    // 누적 계산
    final processedData =
        _filterAndProcessData(filteredData, startDate, endDate);

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 400.0,
      child: SfCartesianChart(
        title: ChartTitle(
          text: '과목별 선형 차트',
          textStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).title1.fontFamily,
            fontSize: 18,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          textStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
            fontSize: 14,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        primaryXAxis: CategoryAxis(
          labelRotation: 45,
          labelStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText2.fontFamily,
            fontSize: 12,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
            text: 'Study Hours',
            textStyle: TextStyle(
              fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
              fontSize: 14,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          labelStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText2.fontFamily,
            fontSize: 12,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          textStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
            fontSize: 12,
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        series: _buildLineSeries(processedData),
      ),
    );
  }

  Map<String, List<Map<String, dynamic>>> _filterAndProcessData(
      List<PageStateSchemaStruct> data, DateTime startDate, DateTime endDate) {
    Map<String, List<Map<String, dynamic>>> cumulativeData = {};
    Map<String, Color> subjectColorMap = {}; // 과목별 색상 매핑

    // 날짜 범위 생성
    List<String> dateRange = List.generate(
      endDate.difference(startDate).inDays + 1,
      (i) => DateFormat('yyyy/MM/dd').format(startDate.add(Duration(days: i))),
    );

    // 초기화: 각 날짜별로 과목별 공부 시간을 0으로 설정
    final allSubjects = <String>{};

    for (var pageState in data) {
      for (var input in pageState.inputListState ?? []) {
        final subjectName = input.subjectNamePlanner ?? "Unknown";
        allSubjects.add(subjectName);

        // 과목 색상 매핑
        if (!subjectColorMap.containsKey(subjectName)) {
          subjectColorMap[subjectName] = input.pickedColor ?? Colors.grey;
        }
      }
    }

    for (String date in dateRange) {
      for (String subjectName in allSubjects) {
        cumulativeData.putIfAbsent(subjectName, () => []);
        cumulativeData[subjectName]!.add({
          'date': date, // yyyy/MM/dd 형식을 유지
          'cumulativeHours': 0.0,
          'pickedColor': subjectColorMap[subjectName] ?? Colors.grey, // 색상 적용
        });
      }
    }

    // 데이터 처리
    for (var page in data) {
      final submittedDate = page.submittedDatePlanner;
      if (submittedDate == null) continue;

      final dateKey = DateFormat('yyyy/MM/dd').format(submittedDate);
      List<PlannerInputStruct> inputList = page.inputListState ?? [];

      for (var input in inputList) {
        final subjectName = input.subjectNamePlanner ?? "Unknown";
        final startTimes = input.studyStartTime ?? [];
        final endTimes = input.studyEndTime ?? [];
        double totalHours = 0.0;

        for (int i = 0; i < startTimes.length; i++) {
          totalHours += endTimes[i].difference(startTimes[i]).inMinutes / 60.0;
        }

        // 업데이트: 기존 값을 대체
        final existingIndex = cumulativeData[subjectName]
            ?.indexWhere((data) => data['date'] == dateKey);
        if (existingIndex != null && existingIndex >= 0) {
          cumulativeData[subjectName]![existingIndex]['cumulativeHours'] +=
              totalHours;
        }
      }
    }

    // 정렬
    cumulativeData.forEach((key, value) {
      value.sort((a, b) => DateFormat('yyyy/MM/dd')
          .parse(a['date'])
          .compareTo(DateFormat('yyyy/MM/dd').parse(b['date'])));
    });

    return cumulativeData;
  }

  List<LineSeries<Map<String, dynamic>, String>> _buildLineSeries(
      Map<String, List<Map<String, dynamic>>> cumulativeData) {
    return cumulativeData.entries.map((entry) {
      return LineSeries<Map<String, dynamic>, String>(
        name: entry.key, // 과목 이름
        dataSource: entry.value, // 날짜별 데이터
        xValueMapper: (data, _) => DateFormat('MM/dd').format(
            DateFormat('yyyy/MM/dd').parse(data['date'])), // x축: MM/dd 형식으로 변환
        yValueMapper: (data, _) => data['cumulativeHours'], // y축: 누적 공부 시간
        color: entry.value.isNotEmpty
            ? entry.value.first['pickedColor'] as Color // 색상 적용
            : Colors.grey, // 기본 색상
        markerSettings: MarkerSettings(isVisible: true), // 데이터 포인트 표시
      );
    }).toList();
  }
}
