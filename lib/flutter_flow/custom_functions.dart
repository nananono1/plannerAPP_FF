import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double calculatePlannerCellHeight(
  int startTime,
  int endTime,
) {
  // 앱 상태에서 PlannerStartTime과 PlannerEndTime 값을 가져옵니다.

  double calculateHeight = (478 / (endTime - startTime + 1));
  return calculateHeight;
}

DateTime subtractminusweek(DateTime plannerDateSelected) {
  DateTime newDate = plannerDateSelected.subtract(Duration(days: 6));

  // 새로 계산된 날짜를 반환합니다.
  return newDate;
}

DateTime subtractminusoneday(DateTime plannerDateSelected) {
  DateTime newDate = plannerDateSelected.subtract(Duration(days: 1));

  // 새로 계산된 날짜를 반환합니다.
  return newDate;
}

DocumentReference convertStringToUserReferenceCopy(String userId) {
  // 'users'는 Firestore 컬렉션 이름
  return FirebaseFirestore.instance.collection('users').doc(userId);
}

int? removeLastDigit(int? insertedPin) {
  if (insertedPin == null) {
    return null;
  }

  // insertedPin이 1자리 수 이하인 경우 null 반환 (숫자가 더 없을 때)
  if (insertedPin.toString().length <= 1) {
    return null;
  }

  // insertedPin에서 마지막 자리를 제거
  String pinString = insertedPin.toString();
  String updatedPinString = pinString.substring(0, pinString.length - 1);

  // 제거한 후 다시 int로 변환하여 반환
  return int.parse(updatedPinString);
}

String? calculateListTimeCopy(
  DateTime? startdate,
  DateTime? enddate,
  List<PageStateSchemaStruct> insideDBstudent,
) {
  // 기본값 설정: startdate와 enddate가 null인 경우 기본값 할당
  final DateTime calculatedEndDate = enddate ?? DateTime.now();
  final DateTime calculatedStartDate =
      startdate ?? calculatedEndDate.subtract(Duration(days: 6));

  // 범위 내 데이터 필터링
  final filteredData = insideDBstudent.where((pageState) {
    final submittedDate = pageState.submittedDatePlanner;
    return submittedDate != null &&
        submittedDate
            .isAfter(calculatedStartDate.subtract(Duration(days: 1))) &&
        submittedDate.isBefore(calculatedEndDate.add(Duration(days: 1)));
  }).toList();

  // 총 공부 시간 계산
  num totalMinutes = 0; // num으로 선언하여 타입 충돌 방지

  for (var pageState in filteredData) {
    for (var plannerInput in pageState.inputListState ?? []) {
      final startTimes = plannerInput.studyStartTime ?? [];
      final endTimes = plannerInput.studyEndTime ?? [];

      for (int i = 0; i < startTimes.length; i++) {
        final startTime = startTimes[i];
        final endTime = endTimes[i];

        totalMinutes += endTime.difference(startTime).inMinutes;
      }
    }
  }

  // hh시간 mm분 형식으로 변환
  final hours = (totalMinutes ~/ 60).toInt(); // 명시적 int 변환
  final minutes = (totalMinutes % 60).toInt(); // 명시적 int 변환

  return '${hours}시간 ${minutes}분';
}

List<String> calculateStudyTimeList2(
  List<DateTime> studyStartTimes,
  List<DateTime> studyEndTimes,
) {
  List<String> studyDurations = [];

  // 종료 시간이 시작 시간보다 길면 종료 시간 리스트를 시작 시간 길이에 맞춤 (뒤에서부터 제거)
  if (studyEndTimes.length > studyStartTimes.length) {
    studyEndTimes = studyEndTimes.sublist(
        0, studyStartTimes.length); // 길이를 맞추기 위해 뒤에서부터 잘라냄
  }

  // 반대로 시작 시간이 종료 시간보다 길면, 시작 시간 리스트를 종료 시간에 맞춤 (뒤에서부터 제거)
  if (studyStartTimes.length > studyEndTimes.length) {
    studyStartTimes = studyStartTimes.sublist(
        0, studyEndTimes.length); // 길이를 맞추기 위해 뒤에서부터 잘라냄
  }

  // 각 공부 시간에 대한 계산을 수행
  for (int i = 0; i < studyStartTimes.length; i++) {
    Duration totalDuration = studyEndTimes[i].difference(studyStartTimes[i]);

    int hours = totalDuration.inHours;
    int minutes = totalDuration.inMinutes.remainder(60);
    int seconds = totalDuration.inSeconds.remainder(60);

    studyDurations.add(
      '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
    );
  }

  return studyDurations;
}

String calculateTotalStudyTime(
    List<PlannerInputStruct>? inputListStateForTotal) {
  int totalMinutes = 0;

  // Null 체크 및 오류 처리
  if (inputListStateForTotal == null) {
    return "00시간 00분";
  }

  try {
    // 각 공부 세션의 시간을 순회하며 계산
    for (var item in inputListStateForTotal) {
      if (item.studyStartTime != null && item.studyEndTime != null) {
        for (int i = 0; i < item.studyStartTime!.length; i++) {
          totalMinutes += item.studyEndTime![i]
              .difference(item.studyStartTime![i])
              .inMinutes;
        }
      }
    }
  } catch (e) {
    // 오류 발생 시 00시간 00분 반환
    return "00시간 00분";
  }

  // 시간과 분으로 변환
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;

  // "hh시간 mm분" 형식의 문자열로 반환
  return "${hours.toString().padLeft(2, '0')}h ${minutes.toString().padLeft(2, '0')}m";
}

String calculateStudyTime(
  List<DateTime> studyStartTimes,
  List<DateTime> studyEndTimes,
) {
  Duration totalDuration = Duration();

  for (int i = 0; i < studyStartTimes.length; i++) {
    totalDuration += studyEndTimes[i].difference(studyStartTimes[i]);
  }

  int hours = totalDuration.inHours;
  int minutes = totalDuration.inMinutes.remainder(60);
  int seconds = totalDuration.inSeconds.remainder(60);

  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

Color getCellColorFromInputListState(
  String cellName,
  List<PlannerInputStruct>? inputListState,
) {
  // 기본 색상 설정
  Color defaultColor = Color(0xFFFFFFFF);

  // Null 체크
  if (inputListState == null || inputListState.isEmpty) {
    return defaultColor;
  }

  // 셀 이름에서 rowHour와 cellIndex 추출
  int rowHour = int.parse(cellName.substring(4, 6)); // 셀의 시간(시) 추출
  int cellIndex = int.parse(cellName.substring(6, 7)) - 1; // 셀의 10분 단위 추출

  // 셀의 시작 시간과 종료 시간 계산
  int cellStartMinutes = rowHour * 60 + cellIndex * 10; // 셀 시작 시간 (분 단위)
  int cellEndMinutes = cellStartMinutes + 10; // 셀 종료 시간 (분 단위)

  // 여러 PlannerInputStruct에 대한 색상 추적
  Color? selectedColor;

  // 모든 PlannerInputStruct를 확인
  for (var item in inputListState) {
    if (item.studyStartTime != null && item.studyEndTime != null) {
      for (int j = 0; j < item.studyStartTime!.length; j++) {
        // 공부 시간 (분 단위로 변환)
        DateTime startTime = item.studyStartTime![j];
        DateTime endTime = item.studyEndTime![j];
        int startMinutes = startTime.hour * 60 + startTime.minute;
        int endMinutes = endTime.hour * 60 + endTime.minute;

        // 겹치는 시간 계산
        int overlapStart =
            math.max(cellStartMinutes, startMinutes); // 겹치는 시작 시간
        int overlapEnd = math.min(cellEndMinutes, endMinutes); // 겹치는 종료 시간
        int overlapDuration = overlapEnd - overlapStart; // 겹치는 시간 (분 단위)

        // 5분 이상 겹칠 경우 색상 선택
        if (overlapDuration >= 5) {
          selectedColor = item.pickedColor;
        }
      }
    }
  }

  // 조건을 만족하는 PlannerInputStruct의 색상 반환 (없으면 기본 색상)
  return selectedColor ?? defaultColor;
}

DateTime addoneday(DateTime plannerDateSelected) {
  DateTime newDate = plannerDateSelected.add(Duration(days: 1));

  // 새로 계산된 날짜를 반환합니다.
  return newDate;
}

int getIndexFunction(
  List<PageStateSchemaStruct> dBList,
  DateTime plannerDateSelected,
) {
  // 조건을 만족하는 첫 번째 항목의 인덱스를 찾습니다.
  int index = dBList.indexWhere(
      (element) => element.submittedDatePlanner == plannerDateSelected);

  return index; // 일치하는 항목이 없으면 -1이 반환됩니다.
}

String convertToImagePath(String? imageUrl) {
  // 이미지 URL이 비어있지 않다면 해당 경로 반환
  if (imageUrl != null && imageUrl.isNotEmpty) {
    return imageUrl; // 네트워크 경로를 반환
  } else {
    // 기본 이미지 경로 반환 (경로가 없을 경우 대비)
    return 'https://default-image-url.com/default.jpg'; // 기본 이미지 경로
  }
}

DateTime getDateAtMidnight(DateTime currentTime) {
// 입력받은 시간에서 시간을 없애고 해당 날짜의 자정(12:00 AM)으로 설정
  return DateTime(
      currentTime.year, currentTime.month, currentTime.day, 0, 0, 0);
}

List<DailyInfoEachStruct>? makeDailyList(
    PageStateSchemaStruct? todayStudyInfo) {
  // 먼저 null 체크를 통해 입력된 값이 유효한지 확인합니다.
  if (todayStudyInfo == null || todayStudyInfo.inputListState == null) {
    return null;
  }

  // 결과를 저장할 리스트를 생성합니다.
  List<DailyInfoEachStruct> dailyList = [];

  // 모든 PlannerInputStruct 항목을 순회합니다.
  for (PlannerInputStruct input in todayStudyInfo.inputListState!) {
    if (input.studyStartTime == null ||
        input.studyEndTime == null ||
        input.studyStartTime!.length != input.studyEndTime!.length) {
      continue; // 시작 시간과 종료 시간이 없거나 일치하지 않으면 건너뜁니다.
    }

    // 각 PlannerInputStruct에서 start와 end를 순회하며 DailyInfoEachStruct를 생성합니다.
    for (int i = 0; i < input.studyStartTime!.length; i++) {
      DateTime? startTime = input.studyStartTime![i];
      DateTime? endTime = input.studyEndTime![i];

      // DailyInfoEachStruct를 생성하여 리스트에 추가합니다.
      dailyList.add(DailyInfoEachStruct(
        starttime: startTime,
        endtime: endTime,
        colorPicked: input.pickedColor,
        subject: input.subjectNamePlanner,
        details: input.whatIDid, // whatIDid 필드를 details로 매핑
      ));
    }
  }

  // starttime을 기준으로 오름차순 정렬합니다.
  dailyList.sort((a, b) => a.starttime!.compareTo(b.starttime!));

  return dailyList;
}

String calculateDday(DateTime targetDate) {
  DateTime now = DateTime.now(); // 현재 날짜를 가져옵니다.
  Duration difference = targetDate.difference(now);

  // 차이를 일(day) 단위로 변환합니다.
  int dayDifference = difference.inDays;

  // D-day 형식으로 반환합니다.
  if (dayDifference > 0) {
    return 'D-${dayDifference}'; // 목표일이 미래일 때
  } else if (dayDifference == 0) {
    return 'D-Day'; // 목표일이 오늘일 때
  } else {
    return 'D+${-dayDifference}'; // 목표일이 과거일 때
  }
}

int? appendPin(
  int? insertedPin,
  int? numbertopush,
) {
  if (insertedPin == null) {
    return numbertopush;
  }

  // insertedPin에 numbertopush를 뒤에 추가한 값을 만듦
  int combinedPin = int.parse(insertedPin.toString() + numbertopush.toString());

  // 반환되는 값의 자릿수가 최대 6자리를 넘지 않도록 처리
  if (combinedPin.toString().length > 6) {
    return int.parse(combinedPin.toString().substring(0, 6));
  }

  // 6자리 이하일 경우 그대로 반환
  return combinedPin;
}

List<PageStateSchemaStruct>? fromFirebaseToSchema(
    List<PlannerVariableListRecord>? inputList) {
  if (inputList == null) {
    return null;
  }

  return inputList.map((plannerRecord) {
    // `PageStateSchemaStruct`를 생성하여 `PlannerVariableListRecord`의 필드 값을 매핑합니다.
    return PageStateSchemaStruct(
      inputListState: plannerRecord.inputList, // PlannerInput 타입 리스트로 매핑
      submittedDatePlanner: plannerRecord.submittedDate,
      goodThingsPlanner: plannerRecord.goodThings,
      imporovementState: plannerRecord.improvement,
      archivePercentState: plannerRecord.achivementPercentage,
      teacherquoteState: plannerRecord.teachersQuote,
      isSubmittedPara: plannerRecord.plannerSubmitted,
      adminCheckedPara: plannerRecord.adminChecked,
      dailyStartPara: plannerRecord.dailyStarting,
      basicInfoState: plannerRecord.basicInfo,
      timetableStartIndex: plannerRecord.timetableStartIndex,
      timetableEndIndex: plannerRecord.timetableEndIndex,
      docID: plannerRecord.reference.id, // Firestore 도큐먼트 ID를 저장
    );
  }).toList();
}

double returnDistanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // null 체크
  if (positionOne == null || positionTwo == null) {
    return 0.0;
  }

  // 두 지점 사이의 거리를 계산하는 함수 (하버사인 공식 사용)
  var p = 0.017453292519943295; // π / 180
  var a = 0.5 -
      math.cos((positionTwo.latitude - positionOne.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a)); // 지구 반지름 * 계산된 각도

  // 결과 반환
  return result;
}

LatLng convertToLatlng(
  double lat,
  double lng,
) {
  return LatLng(lat, lng);
}

DocumentReference convertStringToPlannerVariableListReference(
  String userId,
  String documentId,
) {
  // 'users'는 Firestore 상위 컬렉션 이름
  // 'plannerVariableList'는 서브컬렉션 이름
  // 'documentId'는 서브컬렉션의 도큐먼트 ID
  return FirebaseFirestore.instance
      .collection('users') // 상위 컬렉션
      .doc(userId) // 상위 도큐먼트 ID
      .collection('plannerVariableList') // 서브컬렉션 이름
      .doc(documentId); // 서브컬렉션의 도큐먼트 ID
}

int? todaysDayNum(DateTime? datetimeNow) {
  if (datetimeNow == null) {
    return null; // 입력값이 없을 경우 null 반환
  }
  return datetimeNow.weekday; // 1(월요일) ~ 7(일요일)을 반환
}

String? nameMask(String? input) {
  if (input == null || input.isEmpty) {
    return null; // 입력값이 없거나 빈 문자열일 경우 null 반환
  }

  if (input.length == 1) {
    return input; // 문자열이 1글자일 경우 그대로 반환
  }

  // 문자열의 두 번째 글자를 'O'로 변환
  return input[0] + 'O' + (input.length > 2 ? input.substring(2) : '');
}

double calculateAverageStudyTime(
    List<PageStateSchemaStruct> pageStateSchemaList) {
  double totalStudyTimeInSeconds = 0.0;
  int userCount = pageStateSchemaList.length;

  // 사용자가 없으면 평균은 0.0 반환
  if (userCount == 0) {
    return 0.0;
  }

  // 각 사용자의 공부 데이터를 처리
  for (var pageState in pageStateSchemaList) {
    for (var plannerInput in pageState.inputListState) {
      List<DateTime>? startTimeList = plannerInput.studyStartTime ?? [];
      List<DateTime>? endTimeList = plannerInput.studyEndTime ?? [];

      // 시작 시간과 종료 시간이 있는 경우에만 계산
      if (startTimeList.isNotEmpty && endTimeList.isNotEmpty) {
        for (int i = 0; i < startTimeList.length; i++) {
          DateTime startTime = startTimeList[i];
          DateTime endTime = endTimeList[i];
          double studySeconds =
              endTime.difference(startTime).inSeconds.toDouble();

          // 총 공부 시간에 누적
          totalStudyTimeInSeconds += studySeconds;
        }
      }
    }
  }

  // 평균 공부 시간 계산 (초 단위 -> 시간 단위로 변환)
  double averageStudyTimeInHours = totalStudyTimeInSeconds / userCount / 3600.0;

  return averageStudyTimeInHours;
}

String? calculateListaverageTime(
  DateTime? startdate,
  DateTime? enddate,
  List<PageStateSchemaStruct> insideDBstudent,
) {
  // 기본값 설정: startdate와 enddate가 null인 경우 기본값 할당
  final DateTime calculatedEndDate = enddate ?? DateTime.now();
  final DateTime calculatedStartDate =
      startdate ?? calculatedEndDate.subtract(Duration(days: 6));

  // 범위 내 데이터 필터링
  final filteredData = insideDBstudent.where((pageState) {
    final submittedDate = pageState.submittedDatePlanner;
    return submittedDate != null &&
        submittedDate
            .isAfter(calculatedStartDate.subtract(Duration(days: 1))) &&
        submittedDate.isBefore(calculatedEndDate.add(Duration(days: 1)));
  }).toList();

  // 총 공부 시간 및 일수 계산
  num totalMinutes = 0; // 총 공부 시간 (분 단위)
  int studyDays = 0; // 실제 공부한 날짜 수

  for (var pageState in filteredData) {
    num dailyMinutes = 0; // 하루 공부 시간

    for (var plannerInput in pageState.inputListState ?? []) {
      final startTimes = plannerInput.studyStartTime ?? [];
      final endTimes = plannerInput.studyEndTime ?? [];

      for (int i = 0; i < startTimes.length; i++) {
        final startTime = startTimes[i];
        final endTime = endTimes[i];

        dailyMinutes += endTime.difference(startTime).inMinutes;
      }
    }

    if (dailyMinutes > 0) {
      studyDays++; // 하루라도 공부했다면 일수 증가
      totalMinutes += dailyMinutes; // 총 공부 시간 누적
    }
  }

  // 평균 계산
  if (studyDays == 0) {
    return '0시간 0분'; // 공부한 날이 없으면 0시간 0분 반환
  }

  final averageMinutes = totalMinutes / studyDays;
  final hours = (averageMinutes ~/ 60).toInt(); // 평균 시간을 시간으로 변환
  final minutes = (averageMinutes % 60).toInt(); // 나머지는 분으로 변환

  return '${hours}시간 ${minutes}분';
}

int? calculatePointDay(PageStateSchemaStruct? inputstate) {
  if (inputstate == null || inputstate.inputListState == null) {
    print('Input state or inputListState is null');
    return null;
  }

  final inputList = inputstate.inputListState!; // inputListState 가져오기
  int totalPoints = 0;

  for (final plannerInput in inputList) {
    final studyStartTimes = plannerInput.studyStartTime ?? [];
    final studyEndTimes = plannerInput.studyEndTime ?? [];
    final inNaegongList = plannerInput.inNaegong ?? [];

    if (studyStartTimes.isEmpty ||
        studyEndTimes.isEmpty ||
        inNaegongList.isEmpty ||
        studyStartTimes.length != studyEndTimes.length ||
        studyStartTimes.length != inNaegongList.length) {
      print('Invalid study times or inNaegong in plannerInput');
      continue; // 잘못된 데이터 건너뛰기
    }

    // 각 세션에 대해 포인트 계산
    for (int i = 0; i < studyStartTimes.length; i++) {
      final startDate = studyStartTimes[i];
      final endDate = studyEndTimes[i];
      final isInNaegong = inNaegongList[i];

      if (startDate == null || endDate == null || isInNaegong != true) {
        print('Skipping session $i due to null dates or inNaegong is not true');
        continue;
      }

      print('Calculating points for session $i:');
      print('Start Date: $startDate');
      print('End Date: $endDate');

      // Define time ranges for peak and non-peak hours
      final morningStart =
          DateTime(startDate.year, startDate.month, startDate.day, 8, 0);
      final morningEnd =
          DateTime(startDate.year, startDate.month, startDate.day, 10, 0);
      final eveningStart =
          DateTime(startDate.year, startDate.month, startDate.day, 22, 20);
      final eveningEnd = DateTime(
          startDate.year, startDate.month, startDate.day, 23, 59, 59, 999);
      final nextDayMorningStart =
          DateTime(startDate.year, startDate.month, startDate.day, 0, 30);
      final nextDayMorningEnd =
          DateTime(startDate.year, startDate.month, startDate.day, 8, 0);

      // Calculate points for Non-Peak Time (09:00~22:20)
      if (startDate.isBefore(eveningStart) && endDate.isAfter(morningEnd)) {
        final nonPeakStart =
            startDate.isAfter(morningEnd) ? startDate : morningEnd;
        final nonPeakEnd =
            endDate.isBefore(eveningStart) ? endDate : eveningStart;
        final nonPeakMinutes = nonPeakEnd.difference(nonPeakStart).inMinutes;
        totalPoints += (nonPeakMinutes * 1.6667).round();
        print('Non-Peak Points (09:00~22:20): $totalPoints');
      }

      // Calculate points for Peak Time (08:00~10:00)
      if (startDate.isBefore(morningEnd) && endDate.isAfter(morningStart)) {
        final overlapStart =
            startDate.isAfter(morningStart) ? startDate : morningStart;
        final overlapEnd = endDate.isBefore(morningEnd) ? endDate : morningEnd;
        final peakMinutes = overlapEnd.difference(overlapStart).inMinutes;
        totalPoints += (peakMinutes * 8.3334).round();
        print('Peak Points (08:00~10:00): $totalPoints');
      }

      // Calculate points for Peak Time (22:20~23:59)
      if (startDate.isBefore(eveningEnd) && endDate.isAfter(eveningStart)) {
        final overlapStart =
            startDate.isAfter(eveningStart) ? startDate : eveningStart;
        final overlapEnd = endDate.isBefore(eveningEnd) ? endDate : eveningEnd;
        final peakMinutes = overlapEnd.difference(overlapStart).inMinutes;
        totalPoints += (peakMinutes * 8.3334).round();
        print('Peak Points (22:20~23:59): $totalPoints');
      }

      // Calculate points for Non-Peak Time (00:30~07:00)
      if (startDate.isBefore(nextDayMorningEnd) &&
          endDate.isAfter(nextDayMorningStart)) {
        final nonPeakStart = startDate.isAfter(nextDayMorningStart)
            ? startDate
            : nextDayMorningStart;
        final nonPeakEnd =
            endDate.isBefore(nextDayMorningEnd) ? endDate : nextDayMorningEnd;
        final nonPeakMinutes = nonPeakEnd.difference(nonPeakStart).inMinutes;
        totalPoints += (nonPeakMinutes * 1.6667).round();
        print('Non-Peak Points (00:30~07:00): $totalPoints');
      }
    }
  }

  print('Total Points for Day: $totalPoints');
  return totalPoints;
}

List<AdmincallListenerStruct> admincallJsonToDataType(dynamic input) {
  // 입력 데이터가 null이거나 Map 형식이 아닌 경우 빈 리스트 반환
  if (input == null || input is! Map<String, dynamic>) {
    return [];
  }

  // JSON 데이터를 리스트로 변환
  return input.entries.map((entry) {
    final value = entry.value;
    return AdmincallListenerStruct(
      callreason: value['callreason'] ?? '', // callreason 값 또는 빈 문자열
      calltime: value['calltime'] != null
          ? DateTime.parse(value['calltime']) // calltime을 DateTime으로 변환
          : null,
      checked: value['checked'] ?? false, // checked 값 또는 기본값 false
      seatno: value['seatno'] ?? '', // seatno 값 또는 빈 문자열
    );
  }).toList();
}

dynamic convertTimetableToJson(WeeklyTimeTableStruct? timetable) {
  if (timetable == null) {
    return null;
  }

  Map<String, dynamic> jsonData = {
    "tablename": timetable.tablename ?? "",
    "mon": _convertDailyFormatToJson(timetable.mon),
    "tue": _convertDailyFormatToJson(timetable.tue),
    "wed": _convertDailyFormatToJson(timetable.wed),
    "thu": _convertDailyFormatToJson(timetable.thu),
    "fri": _convertDailyFormatToJson(timetable.fri),
    "sat": _convertDailyFormatToJson(timetable.sat),
    "sun": _convertDailyFormatToJson(timetable.sun),
    "updatedDate": timetable.updatedDate?.toIso8601String(),
  };

  return jsonData;
}

Map<String, dynamic>? _convertDailyFormatToJson(
    DailyTimeTableFormatStruct? dailyFormat) {
  if (dailyFormat == null) {
    return null;
  }

  return {
    "naegongStartTime": dailyFormat.naegongStartTime != null
        ? _toIso8601(dailyFormat.naegongStartTime!)
        : null,
    "naegongEndTime": dailyFormat.naegongEndTime != null
        ? _toIso8601(dailyFormat.naegongEndTime!)
        : null,
    "dailyoutingList": dailyFormat.dailyoutingList
        ?.map((outing) => _convertOutingToJson(outing))
        .toList(),
    "nonExistingDate": dailyFormat.nonExistingDate ?? false,
    "dayNaegongColor": dailyFormat.dayNaegongColor != null
        ? _convertColorToCss(dailyFormat.dayNaegongColor!)
        : null,
  };
}

Map<String, dynamic> _convertOutingToJson(DailyOutingStruct outing) {
  return {
    "reason": outing.reason ?? "",
    "outingstarttime": outing.outingstarttime != null
        ? _toIso8601(outing.outingstarttime!)
        : null,
    "outingendtime":
        outing.outingendtime != null ? _toIso8601(outing.outingendtime!) : null,
    "color": outing.color != null ? _convertColorToCss(outing.color!) : null,
  };
}

/// DateTime 객체를 ISO 형식 문자열로 변환
String _toIso8601(DateTime dateTime) {
  return dateTime.toIso8601String();
}

/// Color 객체를 CSS 형식의 문자열로 변환
String _convertColorToCss(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
}

double convertStringToDouble(String? input) {
  return double.tryParse((input ?? '').replaceAll(',', '')) ?? 0.0;
}

List<ConvertCostCallPerSpotStruct> convertJsonToCostList(
  dynamic apiResponse,
  DateTime startDate,
  DateTime endDate,
) {
  List<ConvertCostCallPerSpotStruct> resultList = [];

  // ✅ JSON에서 각 날짜별 데이터를 리스트로 변환
  apiResponse.forEach((date, value) {
    if (value is Map<String, dynamic>) {
      // ✅ String 날짜를 DateTime으로 변환
      DateTime parsedDate = DateTime.tryParse(date) ?? DateTime(2000, 1, 1);

      // ✅ 주어진 날짜 범위 내에 있는지 확인
      if (parsedDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          parsedDate.isBefore(endDate.add(Duration(days: 1)))) {
        final item = ConvertCostCallPerSpotStruct(
          date: value['date'] ?? date, // date 필드가 없을 경우 키 값(date) 사용
          totalActiveUser: value['totalActiveUsers']?.toString() ?? '0',
          activeSeats: List<int>.from(value['activeSeats'] ?? []),
        );

        resultList.add(item);
      }
    }
  });

  return resultList;
}

int getStringLength(String inputString) {
  return inputString.length; // 문자열 길이 반환
}

int getTotalActiveUserSumFromCostCallList(
    List<ConvertCostCallPerSpotStruct>? costCallList) {
  // costCallList가 null이면 0 반환
  if (costCallList == null) {
    return 0;
  }

  // 합계 저장 변수
  int totalSum = 0;

  // 각 항목 순회
  for (final item in costCallList) {
    try {
      // totalActiveUser는 String이므로 int로 파싱
      final int userCount = int.tryParse(item.totalActiveUser) ?? 0;
      totalSum += userCount;
    } catch (e) {
      // 파싱 중 오류가 나면 무시하고 다음으로 넘어감
      continue;
    }
  }

  // 최종 합계 반환
  return totalSum;
}

DateTime stringToTime(
  String hour,
  String minute,
) {
  // 문자열을 정수형으로 변환
  int parsedHour = int.tryParse(hour) ?? 0;
  int parsedMinute = int.tryParse(minute) ?? 0;

  // 변환된 값을 사용해서 DateTime 객체 생성
  // 연도, 월, 일은 기본값 (예: 2000년 1월 1일)으로 설정
  return DateTime(2000, 1, 1, parsedHour, parsedMinute);
}

DateTime? convertMaskedDateToDateTime(String maskedDate) {
  if (maskedDate == null || maskedDate.trim().isEmpty) {
    return DateTime.now(); // 또는 return null;
  }

  try {
    // "/" 기준으로 문자열을 분리하여 연, 월, 일을 추출
    final parts = maskedDate.split('/');

    // parts 배열은 반드시 [년, 월, 일]의 3개 요소여야 함
    if (parts.length != 3) {
      throw FormatException('올바르지 않은 날짜 형식입니다.');
    }

    // 각각을 정수로 파싱
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);

    // DateTime 객체로 변환하여 반환
    return DateTime(year, month, day);
  } catch (e) {
    // 변환 중 오류가 발생하면 현재 날짜 반환 (또는 null 반환 가능)
    return DateTime.now(); // 또는 return null;
  }
}
