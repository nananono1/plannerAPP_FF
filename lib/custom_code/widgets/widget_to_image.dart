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

// 추가 필요한 import들
import '/auth/firebase_auth/auth_util.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import '/components/widget_to_capture_component_widget.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';

class WidgetToImage extends StatefulWidget {
  const WidgetToImage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _WidgetToImageState createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> captureAndDownloadFromWidget() async {
    try {
      // null 체크
      if (FFAppState().loadedDataID == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('데이터 ID가 없습니다. 다시 시도해주세요.')),
        );
        return;
      }

      // Firestore 업데이트 1
      await FFAppState()
          .loadedDataID!
          .update(createPlannerVariableListRecordData(
            teachersQuote: FFAppState().teachersNote,
            adminChecked: true,
          ));

      // Firestore 업데이트 2
      final userRef = functions.convertStringToUserReferenceCopy(
          FFAppState().pageStateSchemaVariable.basicInfoState.uid);

      await userRef.update(createUsersRecordData(
        popupmainPage: true,
      ));

      // Firestore 업데이트 3
      final plannerRef = functions.convertStringToPlannerVariableListReference(
        FFAppState().pageStateSchemaVariable.basicInfoState.uid,
        FFAppState().pageStateSchemaVariable.docID,
      );

      await plannerRef.update(createPlannerVariableListRecordData(
        teachersQuote: FFAppState().pageStateSchemaVariable.teacherquoteState,
      ));

      // 스크린샷 캡처
      Uint8List? image = await screenshotController.capture();

      if (image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('스크린샷 캡처 실패. 다시 시도해주세요.')),
        );
        return;
      }

      // 이미지 파일 다운로드
      int seatNo = FFAppState().seatNoSelected;
      String fileName = "$seatNo.png";

      final blob = html.Blob([image]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();
      html.Url.revokeObjectUrl(url);

      // 사용자에게 성공 메시지
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이미지가 성공적으로 다운로드되었습니다: $fileName')),
      );

      // 추가 상태 업데이트
      await Future.delayed(const Duration(milliseconds: 300));
      FFAppState().updatePageStateSchemaVariableStruct(
        (e) => e..adminCheckedPara = true,
      );
      FFAppState().updateInsideDBStudentAtIndex(
        FFAppState().maxNumberOfPlan,
        (e) => e..adminCheckedPara = true,
      );
      setState(() {});
    } catch (e) {
      print("Firestore 업데이트 중 오류 발생: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('데이터 업데이트 실패. 다시 시도해주세요. 오류: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!FFAppState().pageStateSchemaVariable.adminCheckedPara)
          ElevatedButton(
            onPressed: () async {
              await captureAndDownloadFromWidget();
            },
            child: Text('플래너 승인 및 저장'),
          ),
        Expanded(
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              width: widget.width ?? 1200,
              height: widget.height ?? 850,
              child: WidgetToCaptureComponentWidget(),
            ),
          ),
        ),
      ],
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
