// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateAppStateWithLatestData(
    String latestTeachersQuote, DateTime latestSubmittedDate) async {
  // 1. FFAppState에서 insideDBStudent 리스트 가져오기 (타입 캐스팅 추가)
  final List<PageStateSchemaStruct> studentList =
      List<PageStateSchemaStruct>.from(FFAppState().insideDBStudent);

  DateTime? selectedDate; // 최종적으로 설정할 날짜를 저장할 변수

  // 2. submittedDatePlanner가 latestSubmittedDate와 같은 항목 찾기
  for (var student in studentList) {
    final DateTime? submittedDate = student.submittedDatePlanner;

    // 날짜 비교를 위해 날짜 형식을 통일할 수 있도록 수정
    if (submittedDate != null &&
        submittedDate.year == latestSubmittedDate.year &&
        submittedDate.month == latestSubmittedDate.month &&
        submittedDate.day == latestSubmittedDate.day) {
      // 3. 해당 항목의 teacherquoteState와 adminCheckedPara 업데이트
      student.teacherquoteState = latestTeachersQuote;
      student.adminCheckedPara = true;

      // 날짜를 선택된 날짜로 저장
      selectedDate = submittedDate;

      // 업데이트 후 break로 루프 종료 (목표 항목 하나만 업데이트)
      break;
    }
  }

  // 4. 업데이트된 리스트를 다시 FFAppState에 저장
  FFAppState().insideDBStudent = List<PageStateSchemaStruct>.from(studentList);

  // 5. selectedDate가 null이 아닌 경우 plannerDateSelected 업데이트
  if (selectedDate != null) {
    FFAppState().plannerDateSelected = selectedDate;
  }

  // 비동기 작업이므로 Future<void> 반환
  return;
}
