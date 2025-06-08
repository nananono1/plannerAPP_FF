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
import 'package:intl/intl.dart'; // 날짜 포맷팅을 위한 패키지

class WeeklyAchievementChart extends StatefulWidget {
  const WeeklyAchievementChart({
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
  State<WeeklyAchievementChart> createState() => _WeeklyAchievementChartState();
}

class _WeeklyAchievementChartState extends State<WeeklyAchievementChart> {
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

    // 목표 달성률 데이터 계산
    final achievementData =
        _calculateAchievementData(filteredData, startDate, endDate);

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 400.0,
      child: SfCartesianChart(
        title: ChartTitle(
          text: '일별 성취도 추이',
          textStyle: TextStyle(
            fontFamily: FlutterFlowTheme.of(context).title1.fontFamily,
            fontSize: 15,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        legend: Legend(
          isVisible: false, // 단일 선이므로 범례는 비활성화
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
            text: 'Achievement (%)',
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
        series: _buildAchievementSeries(achievementData),
      ),
    );
  }

  List<Map<String, dynamic>> _calculateAchievementData(
      List<PageStateSchemaStruct> data, DateTime startDate, DateTime endDate) {
    List<Map<String, dynamic>> achievementData = [];

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

      double dailyAchievement = 0.0;

      if (dailyData.isNotEmpty) {
        // 해당 날짜의 평균 목표 달성률 계산
        dailyAchievement = dailyData
                .map((pageState) => pageState.archivePercentState ?? 0.0)
                .reduce((a, b) => a + b) /
            dailyData.length;
      }

      achievementData.add({
        'date': date,
        'achievement': dailyAchievement,
      });
    }

    return achievementData;
  }

  List<LineSeries<Map<String, dynamic>, String>> _buildAchievementSeries(
      List<Map<String, dynamic>> achievementData) {
    return [
      LineSeries<Map<String, dynamic>, String>(
        name: 'Achievement',
        dataSource: achievementData,
        xValueMapper: (data, _) => DateFormat('MM/dd').format(
            DateFormat('yyyy/MM/dd').parse(data['date'])), // x축: MM/dd 형식으로 변환
        yValueMapper: (data, _) => data['achievement'], // y축: 달성률 (%)
        markerSettings: MarkerSettings(
          isVisible: true,
        ),
        color: Colors.blueAccent, // 선 색상 설정
      ),
    ];
  }
}
