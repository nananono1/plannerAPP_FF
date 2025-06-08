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

import '/custom_code/widgets/index.dart'; // WeeklyPlannerWidget2 포함
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:html' as html;
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import '/app_state.dart';

class WeeklyPlannerCapture extends StatefulWidget {
  const WeeklyPlannerCapture({
    Key? key,
    this.width,
    this.height,
    this.pickedData,
  }) : super(key: key);

  final double? width;
  final double? height;
  final WeeklyTimeTableStruct? pickedData;

  @override
  _WeeklyPlannerCaptureState createState() => _WeeklyPlannerCaptureState();
}

class _WeeklyPlannerCaptureState extends State<WeeklyPlannerCapture> {
  ScreenshotController screenshotController = ScreenshotController();

  /// 이미지 캡처 및 다운로드
  Future<void> captureAndDownloadFromWidget() async {
    try {
      String dateStr = widget.pickedData?.updatedDate != null
          ? DateFormat('yyyyMMdd').format(widget.pickedData!.updatedDate!)
          : "알림없음";
      String studentName = FFAppState().alertReason ?? "학생명";

      String fileName = "${studentName}학생_${dateStr}_시간표"
          .replaceAll(RegExp(r'[\/:*?"<>|]'), '');
      fileName = "$fileName.png";

      Uint8List? image = await screenshotController.capture();

      if (image == null) {
        print("이미지 캡처 실패");
        return;
      }

      final blob = html.Blob([image]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();
      html.Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이미지 다운로드 완료: $fileName')),
      );
    } catch (e) {
      print("오류 발생: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => captureAndDownloadFromWidget(),
          child: Text('주간 시간표 캡처 및 저장'),
        ),
        SizedBox(height: 12),
        Expanded(
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              width: widget.width ?? 1200,
              height: widget.height ?? 1050,
              child: widget.pickedData != null
                  ? _buildTimeTableUI(widget.pickedData!)
                  : _buildEmptyPlanner(),
            ),
          ),
        ),
      ],
    );
  }

  /// 실제 시간표 UI
  Widget _buildTimeTableUI(WeeklyTimeTableStruct pickedData) {
    return Container(
      width: 900,
      height: 1020,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // 상단 정보 박스
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeaderBox("학생명", FFAppState().alertReason ?? "이름 없음"),
                  _buildHeaderBox2("플래너명", pickedData.tablename ?? "플래너 없음"),
                ],
              ),
            ),
          ),
          // 시간표 위젯 (WeeklyPlannerWidget2)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // ✅ 모서리 둥글게 클리핑
              child: Container(
                width: 640,
                height: 830,
                color: Colors.white, // 배경 지정
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10), // ✅ 내부 여백
                  child: WeeklyPlannerWidget2(
                    width: double.infinity,
                    height: 830,
                    pickedData: pickedData,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 상단 정보 박스
  Widget _buildHeaderBox(String label, String value) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        "$label : $value",
        style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildHeaderBox2(String label, String value) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        "$value",
        style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  /// 데이터가 없을 경우 표시
  Widget _buildEmptyPlanner() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          '주간 시간표 데이터가 없습니다.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
