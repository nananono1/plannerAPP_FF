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

import 'package:fl_chart/fl_chart.dart'; // fl_chart 패키지

class CumulativeLineChartRoundConvertFL extends StatefulWidget {
  const CumulativeLineChartRoundConvertFL({
    super.key,
    this.width,
    this.height,
    required this.insideDBStudent,
  });

  final double? width;
  final double? height;
  final List<PageStateSchemaStruct> insideDBStudent;

  @override
  State<CumulativeLineChartRoundConvertFL> createState() =>
      _CumulativeLineChartRoundConvertFLState();
}

class _CumulativeLineChartRoundConvertFLState
    extends State<CumulativeLineChartRoundConvertFL> {
  bool isWeekly = true;

  @override
  Widget build(BuildContext context) {
    final DateTime endDate = DateTime.now();
    final DateTime startDate = isWeekly
        ? endDate.subtract(Duration(days: 7))
        : endDate.subtract(Duration(days: 28));

    // 데이터를 필터링 및 정렬
    final filteredData = widget.insideDBStudent.where((pageState) {
      final submittedDate = pageState.submittedDatePlanner;
      return submittedDate != null &&
          submittedDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          submittedDate.isBefore(endDate.add(Duration(days: 1)));
    }).toList()
      ..sort((a, b) =>
          a.submittedDatePlanner!.compareTo(b.submittedDatePlanner!)); // 날짜 정렬

    // 데이터 가공
    final cumulativeData =
        _calculateCumulativeStudyHours(startDate, endDate, filteredData);

    // 데이터의 최대값 계산
    final maxValue = cumulativeData.values
        .expand((e) => e)
        .map((e) => e['cumulativeHours'] as double)
        .fold(0.0, (prev, value) => value > prev ? value : prev);

    return GestureDetector(
      onLongPress: () {
        setState(() {
          isWeekly = !isWeekly;
        });
      },
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 400.0,
        child: LineChart(
          LineChartData(
            lineBarsData: _buildLineBarsData(cumulativeData, maxValue),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toStringAsFixed(1),
                      style: TextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    final weekDays = [
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat'
                    ];
                    return Text(
                      weekDays[value.toInt() % 7],
                      style: TextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
            ),
            gridData: FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey, width: 1),
            ),
            minY: 0,
            maxY: maxValue * 1.3, // 최대값의 1.3배로 설정
            lineTouchData: LineTouchData(enabled: true),
          ),
        ),
      ),
    );
  }

  // LineBarChart의 데이터 설정
  List<LineChartBarData> _buildLineBarsData(
      Map<String, List<Map<String, dynamic>>> cumulativeData, double maxValue) {
    List<LineChartBarData> lineBars = cumulativeData.entries.map((entry) {
      final pickedColor = entry.value.isNotEmpty
          ? entry.value.first['pickedColor'] as Color
          : Colors.grey;

      return LineChartBarData(
        isCurved: true,
        color: pickedColor,
        barWidth: 3,
        spots: entry.value
            .map((data) => FlSpot(
                  double.parse(data['dateIndex'].toString()),
                  data['cumulativeHours'],
                ))
            .toList(),
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
      );
    }).toList();

    // 평균값 계산
    double totalSum = 0;
    int totalCount = 0;
    cumulativeData.values.forEach((subjectData) {
      subjectData.forEach((data) {
        totalSum += data['cumulativeHours'];
        totalCount++;
      });
    });

    final double averageValue = totalCount > 0 ? totalSum / totalCount : 0;

    // 평균값 선 추가
    lineBars.add(LineChartBarData(
      isCurved: false,
      color: const Color(0x73FFF200), // #73FFF200 색상
      barWidth: 2,
      dashArray: [5, 5], // 점선 스타일
      spots: List.generate(
        cumulativeData.entries.first.value.length,
        (index) => FlSpot(
          index.toDouble(),
          averageValue,
        ),
      ),
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
    ));

    return lineBars;
  }

  // 데이터 가공 함수
  Map<String, List<Map<String, dynamic>>> _calculateCumulativeStudyHours(
      DateTime startDate,
      DateTime endDate,
      List<PageStateSchemaStruct> filteredData) {
    Map<String, List<Map<String, dynamic>>> cumulativeData = {};
    Map<String, double> subjectTotalHours = {};

    List<String> dateRange = List.generate(
      endDate.difference(startDate).inDays + 1,
      (i) =>
          '${startDate.add(Duration(days: i)).month}/${startDate.add(Duration(days: i)).day}',
    );

    for (int i = 0; i < dateRange.length; i++) {
      for (var subjectName in filteredData
          .expand((page) =>
              page.inputListState
                  ?.map((input) => input.subjectNamePlanner)
                  .toSet() ??
              {})
          .toSet()) {
        cumulativeData.putIfAbsent(subjectName ?? "Unknown", () => []);
        cumulativeData[subjectName]!.add({
          'dateIndex': i.toDouble(),
          'cumulativeHours': subjectTotalHours[subjectName] ?? 0.0,
          'pickedColor': filteredData
                  .firstWhere((page) => page.inputListState!
                      .any((input) => input.subjectNamePlanner == subjectName))
                  .inputListState!
                  .firstWhere(
                      (input) => input.subjectNamePlanner == subjectName)
                  .pickedColor ??
              Colors.grey
        });
      }
    }

    for (var pageState in filteredData) {
      final dateIndex = dateRange.indexOf(
          '${pageState.submittedDatePlanner!.month}/${pageState.submittedDatePlanner!.day}');
      if (dateIndex == -1) continue;

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
            final duration =
                endTimes[i].difference(startTimes[i]).inMinutes / 60.0;
            dailyStudyHours += duration;
          }

          subjectTotalHours[subjectName] =
              (subjectTotalHours[subjectName] ?? 0) + dailyStudyHours;

          cumulativeData[subjectName]!
              .removeWhere((data) => data['dateIndex'] == dateIndex.toDouble());
          cumulativeData[subjectName]!.add({
            'dateIndex': dateIndex.toDouble(),
            'cumulativeHours': subjectTotalHours[subjectName],
            'pickedColor': plannerInput.pickedColor ?? Colors.grey
          });
        }
      }
    }

    cumulativeData.forEach((key, value) {
      value.sort((a, b) =>
          (a['dateIndex'] as double).compareTo(b['dateIndex'] as double));
    });

    return cumulativeData;
  }
}
