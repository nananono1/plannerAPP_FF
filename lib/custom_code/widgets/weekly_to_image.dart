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

import 'dart:html' as html;
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import '/components/weekly_to_capture_widget.dart'; // 수정된 위젯 import
import 'package:provider/provider.dart'; // AppState를 위한 Provider
import '/app_state.dart'; // FFAppState import

class WeeklyToImage extends StatefulWidget {
  const WeeklyToImage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _WeeklyToImageState createState() => _WeeklyToImageState();
}

class _WeeklyToImageState extends State<WeeklyToImage> {
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> captureAndDownloadFromWidget() async {
    try {
      // FFAppState에서 파일 이름 생성
      String alertReason = FFAppState().alertReason ?? "알림없음"; // 기본값 설정
      String rapidClickCount = FFAppState().rapidClickAvoidCount.toString();

      // 파일명 구성 (예: "5번_집중력저하_피드백.png")
      String fileName = "${rapidClickCount}번_${alertReason}_피드백"
          .replaceAll(RegExp(r'[\/:*?"<>|]'), '');
      fileName = "$fileName.png"; // 확장자 추가

      // 스크린샷 캡처
      Uint8List? image = await screenshotController.capture();

      if (image == null) {
        print("이미지 캡처 실패");
        return;
      }

      // 파일 다운로드
      final blob = html.Blob([image]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();
      html.Url.revokeObjectUrl(url);

      // 알림 메시지
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('이미지가 성공적으로 다운로드되었습니다. 파일 이름: $fileName'),
        ),
      );
    } catch (e) {
      print("위젯 캡처 및 다운로드 중 오류 발생: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // AppState 사용 준비
    final appState = context.watch<FFAppState>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 캡처 및 다운로드 버튼
        ElevatedButton(
          onPressed: () async {
            await captureAndDownloadFromWidget();
          },
          child: Text('주간 위젯 캡처 및 저장'),
        ),

        // 캡처 대상 위젯
        Expanded(
          child: Screenshot(
            controller: screenshotController,
            child: Builder(
              builder: (context) {
                return Container(
                  width: widget.width ?? 1200,
                  height: widget.height ?? 1050,
                  child: WeeklyToCaptureWidget(), // ✅ 변경된 캡처 대상 위젯
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
