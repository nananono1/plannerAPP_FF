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
import 'package:intl/intl.dart';

class DailyTotalStudyTimeSF extends StatefulWidget {
  const DailyTotalStudyTimeSF({
    super.key,
    this.width,
    this.height,
    required this.insideDBStudent,
    this.startDate,
    this.endDate,
  });

  final double? width;
  final double? height;
  final List<PageStateSchemaStruct> insideDBStudent;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<DailyTotalStudyTimeSF> createState() => _DailyTotalStudyTimeSFState();
}

class _DailyTotalStudyTimeSFState extends State<DailyTotalStudyTimeSF> {
  late Map<String, double> dailyTotalStudyTime;
  late double maxValue;
  late double averageStudyTime;
  late List<Map<String, dynamic>> chartData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _prepareChartData();
    });
  }

  @override
  void didUpdateWidget(covariant DailyTotalStudyTimeSF oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startDate != oldWidget.startDate ||
        widget.endDate != oldWidget.endDate ||
        widget.insideDBStudent != oldWidget.insideDBStudent) {
      _prepareChartData();
    }
  }

  void _prepareChartData() {
    setState(() {
      final DateTime calculatedStartDate =
          widget.startDate ?? DateTime.now().subtract(Duration(days: 6));
      final DateTime calculatedEndDate = widget.endDate ?? DateTime.now();

      final filteredData = widget.insideDBStudent.where((pageState) {
        final submittedDate = pageState.submittedDatePlanner;
        return submittedDate != null &&
            submittedDate
                .isAfter(calculatedStartDate.subtract(Duration(days: 1))) &&
            submittedDate.isBefore(calculatedEndDate.add(Duration(days: 1)));
      }).toList()
        ..sort((a, b) =>
            a.submittedDatePlanner!.compareTo(b.submittedDatePlanner!));

      dailyTotalStudyTime = _calculateDailyTotalStudyTime(
        filteredData,
        calculatedStartDate,
        calculatedEndDate,
      );

      maxValue = dailyTotalStudyTime.values.isNotEmpty
          ? dailyTotalStudyTime.values.reduce((a, b) => a > b ? a : b)
          : 0.0;
      averageStudyTime = dailyTotalStudyTime.values.isNotEmpty
          ? dailyTotalStudyTime.values.reduce((a, b) => a + b) /
              dailyTotalStudyTime.length
          : 0.0;

      chartData = dailyTotalStudyTime.entries
          .map((entry) => {
                'date': entry.key,
                'studyTime': entry.value,
              })
          .toList();
    });
  }

  Map<String, double> _calculateDailyTotalStudyTime(
    List<PageStateSchemaStruct> filteredData,
    DateTime startDate,
    DateTime endDate,
  ) {
    Map<String, double> dailyTotalStudyTime = {};
    List<String> dateRange = List.generate(
      endDate.difference(startDate).inDays + 1,
      (i) => DateFormat('MM/dd').format(startDate.add(Duration(days: i))),
    );

    for (String date in dateRange) {
      dailyTotalStudyTime[date] = 0.0;
    }

    for (var pageState in filteredData) {
      final submittedDate = pageState.submittedDatePlanner;
      if (submittedDate == null) continue;
      final dateKey = DateFormat('MM/dd').format(submittedDate);
      if (!dailyTotalStudyTime.containsKey(dateKey)) continue;

      final inputList = pageState.inputListState ?? [];
      double totalStudyTime = 0.0;
      for (var input in inputList) {
        final startTimes = input.studyStartTime ?? [];
        final endTimes = input.studyEndTime ?? [];
        for (int i = 0; i < startTimes.length; i++) {
          totalStudyTime +=
              endTimes[i].difference(startTimes[i]).inMinutes / 60.0;
        }
      }
      dailyTotalStudyTime[dateKey] =
          (dailyTotalStudyTime[dateKey] ?? 0) + totalStudyTime;
    }

    return dailyTotalStudyTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            '일별 총 학습 시간',
            style: TextStyle(
              fontFamily: FlutterFlowTheme.of(context).title1.fontFamily,
              fontSize: 18,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(
                fontSize: 14,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            primaryXAxis: CategoryAxis(
              labelRotation: 30,
              labelStyle: TextStyle(
                fontSize: 12,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: '학습 시간 (시간)'),
              labelStyle: TextStyle(
                fontSize: 12,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              minimum: 0,
              maximum: maxValue * 1.2,
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries>[
              LineSeries<Map<String, dynamic>, String>(
                name: '일별 학습 시간',
                dataSource: chartData,
                xValueMapper: (data, _) => data['date'],
                yValueMapper: (data, _) => data['studyTime'],
                markerSettings: MarkerSettings(isVisible: true),
                dataLabelSettings: DataLabelSettings(isVisible: false),
                color: Colors.blue,
              ),
              LineSeries<Map<String, dynamic>, String>(
                name: '평균 학습 시간',
                dataSource: chartData,
                xValueMapper: (data, _) => data['date'],
                yValueMapper: (data, _) => averageStudyTime,
                markerSettings: MarkerSettings(isVisible: false),
                dataLabelSettings: DataLabelSettings(isVisible: false),
                color: Colors.yellow,
                dashArray: [5, 5],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
