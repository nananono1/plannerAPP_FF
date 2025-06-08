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

class CumulativeLineChartRoundConvert extends StatefulWidget {
  const CumulativeLineChartRoundConvert({
    super.key,
    this.width,
    this.height,
    required this.insideDBStudent,
  });

  final double? width;
  final double? height;
  final List<PageStateSchemaStruct> insideDBStudent;

  @override
  State<CumulativeLineChartRoundConvert> createState() =>
      _CumulativeLineChartRoundConvertState();
}

class _CumulativeLineChartRoundConvertState
    extends State<CumulativeLineChartRoundConvert> {
  // 주간 데이터 또는 월간 데이터 상태를 관리하는 변수
  bool isWeekly = true;

  @override
  Widget build(BuildContext context) {
    // 주간 데이터 또는 월간 데이터를 기준으로 차트 데이터를 필터링
    final DateTime endDate = DateTime.now();
    final DateTime startDate = isWeekly
        ? endDate.subtract(Duration(days: 7)) // 주간 데이터: 7일
        : endDate.subtract(Duration(days: 28)); // 월간 데이터: 28일

    // 선택된 기간에 맞는 공부 데이터를 필터링 및 정렬
    final filteredData = widget.insideDBStudent.where((pageState) {
      final submittedDate = pageState.submittedDatePlanner;
      return submittedDate != null &&
          submittedDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          submittedDate.isBefore(endDate.add(Duration(days: 1)));
    }).toList()
      ..sort((a, b) => a.submittedDatePlanner!
          .compareTo(b.submittedDatePlanner!)); // 날짜 기준으로 정렬

    // 각 날짜별로 공부 시간을 누적
    final cumulativeData =
        _calculateCumulativeStudyHours(startDate, endDate, filteredData);

    return GestureDetector(
      onLongPress: () {
        setState(() {
          // 롱프레스할 때 주간/월간 데이터를 토글
          isWeekly = !isWeekly;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // 애니메이션 시간 설정
        transitionBuilder: (Widget child, Animation<double> animation) {
          // Flip 애니메이션 적용
          final flipAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
          return AnimatedBuilder(
            animation: flipAnimation,
            child: child,
            builder: (BuildContext context, Widget? child) {
              final isFront = flipAnimation.value < 0.5;
              final angle = isFront
                  ? flipAnimation.value * 3.14159
                  : flipAnimation.value * 3.14159 + 3.14159;
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(angle),
                child: child,
              );
            },
          );
        },
        child: Container(
          key: ValueKey(isWeekly), // 데이터가 변경될 때마다 애니메이션 실행
          width: widget.width ?? double.infinity,
          height: widget.height ?? 400.0,
          child: SfCartesianChart(
            backgroundColor: FlutterFlowTheme.of(context)
                .primaryBackground, // primaryBackground로 수정
            title: ChartTitle(
                text: isWeekly
                    ? 'Cumulative Study Hours (Last 7 Days)'
                    : 'Cumulative Study Hours (Last 28 Days)'),
            legend: Legend(isVisible: true),
            primaryXAxis: CategoryAxis(
              labelRotation: 45, // 라벨을 45도 기울여서 날짜가 겹치지 않도록 설정
            ),
            primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Study Hours')), // y축: 공부 시간 (시간 단위)
            tooltipBehavior: TooltipBehavior(enable: true), // 툴팁 사용 설정
            series: _buildSplineSeries(cumulativeData), // 직선 대신 곡선을 그리도록 변경
          ),
        ),
      ),
    );
  }

  // 공부 데이터를 처리하여 날짜별 누적 시간을 계산하는 함수
  List<SplineSeries<Map<String, dynamic>, String>> _buildSplineSeries(
      Map<String, List<Map<String, dynamic>>> cumulativeData) {
    return cumulativeData.entries.map((entry) {
      // 첫번째로 등장하는 데이터에서 과목의 색상을 가져옵니다.
      final pickedColor = entry.value.isNotEmpty
          ? entry.value.first['pickedColor'] as Color
          : Colors.grey;

      return SplineSeries<Map<String, dynamic>, String>(
        name: entry.key, // 과목 이름
        color: pickedColor, // 첫번째 데이터의 색상을 사용
        dataSource: entry.value, // 날짜별 누적 데이터
        xValueMapper: (data, _) => data['date'], // x축: 날짜
        yValueMapper: (data, _) => data['cumulativeHours'], // y축: 누적 공부 시간
        markerSettings: MarkerSettings(isVisible: false), // 마커 제거
        dataLabelSettings: DataLabelSettings(isVisible: true), // 데이터 라벨 표시
        dataLabelMapper: (data, _) {
          // 누적 공부 시간이 0.0일 경우 라벨을 표시하지 않음
          final cumulativeHours = data['cumulativeHours'];
          if (cumulativeHours == 0.0) {
            return ''; // 0.0일 경우 빈 문자열 반환 -> 라벨 표시 안 함
          }
          return cumulativeHours.toStringAsFixed(1); // 0.0이 아닌 경우 소수점 한 자리까지 표시
        }, // 소수점 한 자리까지 표시
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

    // 기준일로부터 날짜 리스트 생성 (MM/dd 형식으로 변경)
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
          'pickedColor': filteredData
                  .firstWhere((page) => page.inputListState!
                      .any((input) => input.subjectNamePlanner == subjectName))
                  .inputListState!
                  .firstWhere(
                      (input) => input.subjectNamePlanner == subjectName)
                  .pickedColor ??
              Colors.grey // 첫 번째 데이터의 색상 가져오기
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
              'pickedColor':
                  plannerInput.pickedColor ?? Colors.grey // 해당 과목의 색상
            });
          }
        }
      }
    }

    // 누적된 데이터는 날짜별로 정렬
    cumulativeData.forEach((subjectName, dataList) {
      dataList.sort((a, b) => DateFormat('MM/dd')
          .parse(a['date'])
          .compareTo(DateFormat('MM/dd').parse(b['date'])));
    });

    return cumulativeData;
  }
}
