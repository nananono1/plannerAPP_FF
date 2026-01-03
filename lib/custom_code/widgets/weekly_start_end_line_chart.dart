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

class WeeklyStartEndLineChart extends StatefulWidget {
  const WeeklyStartEndLineChart({
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
  State<WeeklyStartEndLineChart> createState() =>
      _WeeklyStartEndLineChartState();
}

class _WeeklyStartEndLineChartState extends State<WeeklyStartEndLineChart> {
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

    // 시작 및 종료 시간 데이터 계산
    final startEndData =
        _calculateStartEndData(filteredData, startDate, endDate);

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 400.0,
      child: SfCartesianChart(
        title: ChartTitle(
          text: '공부 시작/종료 시각 추이',
          textStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).title1.fontFamily,
            fontSize: 15,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          textStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
            fontSize: 10,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        primaryXAxis: CategoryAxis(
          labelRotation: 30,
          labelStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText2.fontFamily,
            fontSize: 10,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
            text: 'Hour of the Day',
            textStyle: TextStyle(
              fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
              fontSize: 10,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          labelStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText2.fontFamily,
            fontSize: 10,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          textStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).bodyText1.fontFamily,
            fontSize: 10,
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        series: _buildLineSeries(startEndData),
      ),
    );
  }

  Map<String, List<Map<String, dynamic>>> _calculateStartEndData(
      List<PageStateSchemaStruct> data, DateTime startDate, DateTime endDate) {
    Map<String, List<Map<String, dynamic>>> startEndData = {
      'Start Times': [],
      'End Times': []
    };

    // 날짜 범위 생성
    List<String> dateRange = List.generate(
      endDate.difference(startDate).inDays + 1,
      (i) => DateFormat('yyyy/MM/dd').format(startDate.add(Duration(days: i))),
    );

    for (String date in dateRange) {
      // 해당 날짜에 해당하는 데이터 필터링
      final dailyData = data.where((pageState) {
        final submittedDate = pageState.submittedDatePlanner;
        return submittedDate != null &&
            DateFormat('yyyy/MM/dd').format(submittedDate) == date;
      }).toList();

      if (dailyData.isEmpty) {
        // 데이터가 없으면 빈 값 추가
        startEndData['Start Times']!.add({
          'date': date,
          'hour': 0.0,
        });
        startEndData['End Times']!.add({
          'date': date,
          'hour': 0.0,
        });
        continue;
      }

      // 해당 날짜의 첫 시작 시간과 마지막 종료 시간 계산
      DateTime? earliestStart;
      DateTime? latestEnd;

      for (var pageState in dailyData) {
        for (var input in pageState.inputListState ?? []) {
          final startTimes = input.studyStartTime ?? [];
          final endTimes = input.studyEndTime ?? [];

          if (startTimes.isNotEmpty) {
            earliestStart = earliestStart == null
                ? startTimes.first
                : (earliestStart.isBefore(startTimes.first)
                    ? earliestStart
                    : startTimes.first);
          }

          if (endTimes.isNotEmpty) {
            latestEnd = latestEnd == null
                ? endTimes.last
                : (latestEnd.isAfter(endTimes.last)
                    ? latestEnd
                    : endTimes.last);
          }
        }
      }

      // 종료 시간이 24시를 넘을 경우 처리
      double adjustedEndHour =
          latestEnd != null && latestEnd.hour < earliestStart!.hour
              ? latestEnd.hour + 24
              : latestEnd?.hour.toDouble() ?? 0.0;

      startEndData['Start Times']!.add({
        'date': date,
        'hour': earliestStart != null
            ? double.parse(earliestStart.hour.toStringAsFixed(1)) // 소숫점 한자리 반영
            : 0.0,
      });
      startEndData['End Times']!.add({
        'date': date,
        'hour': adjustedEndHour != null
            ? double.parse(adjustedEndHour.toStringAsFixed(1)) // 소숫점 한자리 반영
            : 0.0,
      });
    }

    return startEndData;
  }

  List<LineSeries<Map<String, dynamic>, String>> _buildLineSeries(
      Map<String, List<Map<String, dynamic>>> startEndData) {
    return startEndData.entries.map((entry) {
      return LineSeries<Map<String, dynamic>, String>(
        name: entry.key, // Start Times 또는 End Times
        dataSource: entry.value,
        xValueMapper: (data, _) => DateFormat('MM/dd').format(
            DateFormat('yyyy/MM/dd').parse(data['date'])), // x축: MM/dd 형식으로 변환
        yValueMapper: (data, _) =>
            double.parse(data['hour'].toStringAsFixed(1)), // 소숫점 한자리 반영
        markerSettings: MarkerSettings(
          isVisible: true,
        ),
      );
    }).toList();
  }
}
