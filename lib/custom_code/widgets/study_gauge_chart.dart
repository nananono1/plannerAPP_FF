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

import 'package:syncfusion_flutter_gauges/gauges.dart'; // Syncfusion 게이지 차트 패키지
import '/flutter_flow/flutter_flow_theme.dart'; // FlutterFlow 테마

class StudyGaugeChart extends StatefulWidget {
  const StudyGaugeChart({
    super.key,
    this.width, // width 정의
    this.height, // height 정의
    required this.pageStateSchema,
    required this.targetStudyTime, // 목표 공부 시간 (예: "9h 15m")
  });

  final double? width; // width 필드 추가
  final double? height; // height 필드 추가
  final PageStateSchemaStruct pageStateSchema;
  final String targetStudyTime; // 목표 공부 시간

  @override
  State<StudyGaugeChart> createState() => _StudyGaugeChartState();
}

class _StudyGaugeChartState extends State<StudyGaugeChart> {
  @override
  Widget build(BuildContext context) {
    // 목표 공부 시간을 분 단위로 변환
    final targetTimeInMinutes = _parseStudyTime(widget.targetStudyTime);

    // 총 공부 시간을 분 단위로 계산
    final totalStudyTimeInMinutes =
        _calculateTotalStudyTime(widget.pageStateSchema);

    // 목표 대비 총 공부 시간의 비율 (최대 120%로 설정)
    final double studyProgress =
        ((totalStudyTimeInMinutes / targetTimeInMinutes) * 100)
            .clamp(0, 120)
            .toDouble(); // 타입 변환

    return Container(
      width: widget.width ?? 300,
      height: widget.height ?? 300,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0, // 최소값 0
            maximum: 120, // 최대값 120
            interval: 20, // 게이지 간격
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 60,
                color: Colors.green,
              ),
              GaugeRange(
                startValue: 60,
                endValue: 90,
                color: Colors.orange,
              ),
              GaugeRange(
                startValue: 90,
                endValue: 120,
                color: Colors.red,
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: studyProgress, // 목표 대비 총 공부 시간 비율
                needleColor: Colors.blue,
                enableAnimation: true,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  '${studyProgress.toStringAsFixed(1)}%', // 퍼센트 표시
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                angle: 90,
                positionFactor: 0.75,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 목표 공부 시간을 "9h 15m" 형식에서 분으로 변환
  int _parseStudyTime(String studyTime) {
    final hours = int.tryParse(studyTime.split('h')[0].trim()) ?? 0;
    final minutes =
        int.tryParse(studyTime.split('h')[1].split('m')[0].trim()) ?? 0;
    return (hours * 60) + minutes;
  }

  // pageStateSchema에서 총 공부 시간을 계산하는 함수
  int _calculateTotalStudyTime(PageStateSchemaStruct pageStateSchema) {
    int totalMinutes = 0;

    for (var plannerInput in pageStateSchema.inputListState) {
      List<DateTime>? startTimeList = plannerInput.studyStartTime ?? [];
      List<DateTime>? endTimeList = plannerInput.studyEndTime ?? [];

      if (startTimeList.isNotEmpty && endTimeList.isNotEmpty) {
        for (int i = 0; i < startTimeList.length; i++) {
          DateTime startTime = startTimeList[i];
          DateTime endTime = endTimeList[i];
          totalMinutes += endTime.difference(startTime).inMinutes;
        }
      }
    }

    return totalMinutes; // 총 공부 시간을 분 단위로 반환
  }
}
