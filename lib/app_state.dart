import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _insideDBStudent =
          (await secureStorage.getStringList('ff_insideDBStudent'))
                  ?.map((x) {
                    try {
                      return PageStateSchemaStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _insideDBStudent;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_pageStateSchemaVariable') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_pageStateSchemaVariable') ??
                  '{}';
          _pageStateSchemaVariable = PageStateSchemaStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_changeChecker') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_changeChecker') ?? '{}';
          _changeChecker = PageStateSchemaStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _plannerDateSelected =
          await secureStorage.read(key: 'ff_plannerDateSelected') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_plannerDateSelected'))!)
              : _plannerDateSelected;
    });
    await _safeInitAsync(() async {
      _PlannerStartTime = await secureStorage.getInt('ff_PlannerStartTime') ??
          _PlannerStartTime;
    });
    await _safeInitAsync(() async {
      _PlannerEndTime =
          await secureStorage.getInt('ff_PlannerEndTime') ?? _PlannerEndTime;
    });
    await _safeInitAsync(() async {
      _timeIsGoing =
          await secureStorage.getBool('ff_timeIsGoing') ?? _timeIsGoing;
    });
    await _safeInitAsync(() async {
      _maxNumberOfPlan =
          await secureStorage.getInt('ff_maxNumberOfPlan') ?? _maxNumberOfPlan;
    });
    await _safeInitAsync(() async {
      _rapidClickAvoidCount =
          await secureStorage.getInt('ff_rapidClickAvoidCount') ??
              _rapidClickAvoidCount;
    });
    await _safeInitAsync(() async {
      _dDayAppState = (await secureStorage.getStringList('ff_dDayAppState'))
              ?.map((x) {
                try {
                  return DDaySchemaStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dDayAppState;
    });
    await _safeInitAsync(() async {
      _dateselectSafety =
          await secureStorage.read(key: 'ff_dateselectSafety') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_dateselectSafety'))!)
              : _dateselectSafety;
    });
    await _safeInitAsync(() async {
      _fixSubjectColorAppState =
          (await secureStorage.getStringList('ff_fixSubjectColorAppState'))
                  ?.map((x) {
                    try {
                      return FixSubjectColorStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _fixSubjectColorAppState;
    });
    await _safeInitAsync(() async {
      _weeklyTimeTableList =
          (await secureStorage.getStringList('ff_weeklyTimeTableList'))
                  ?.map((x) {
                    try {
                      return WeeklyTimeTableStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _weeklyTimeTableList;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_weeklyTimeTableChoice') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_weeklyTimeTableChoice') ?? '{}';
          _weeklyTimeTableChoice = WeeklyTimeTableStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _alertReason =
          await secureStorage.getString('ff_alertReason') ?? _alertReason;
    });
    await _safeInitAsync(() async {
      _alertNumber =
          await secureStorage.getString('ff_alertNumber') ?? _alertNumber;
    });
    await _safeInitAsync(() async {
      _personalSubjectInfo =
          (await secureStorage.getStringList('ff_personalSubjectInfo'))
                  ?.map((x) {
                    try {
                      return PersonalSubjectEachStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _personalSubjectInfo;
    });
    await _safeInitAsync(() async {
      _updateCheckBool =
          await secureStorage.getBool('ff_updateCheckBool') ?? _updateCheckBool;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_crashBackupData') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_crashBackupData') ?? '{}';
          _crashBackupData = CrashBackUpDataStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _updateChatNum =
          await secureStorage.getInt('ff_updateChatNum') ?? _updateChatNum;
    });
    await _safeInitAsync(() async {
      _popupMainPage =
          await secureStorage.getBool('ff_popupMainPage') ?? _popupMainPage;
    });
    await _safeInitAsync(() async {
      _newCallOnPlanner = await secureStorage.getBool('ff_newCallOnPlanner') ??
          _newCallOnPlanner;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<PageStateSchemaStruct> _insideDBStudent = [];
  List<PageStateSchemaStruct> get insideDBStudent => _insideDBStudent;
  set insideDBStudent(List<PageStateSchemaStruct> value) {
    _insideDBStudent = value;
    secureStorage.setStringList(
        'ff_insideDBStudent', value.map((x) => x.serialize()).toList());
  }

  void deleteInsideDBStudent() {
    secureStorage.delete(key: 'ff_insideDBStudent');
  }

  void addToInsideDBStudent(PageStateSchemaStruct value) {
    insideDBStudent.add(value);
    secureStorage.setStringList('ff_insideDBStudent',
        _insideDBStudent.map((x) => x.serialize()).toList());
  }

  void removeFromInsideDBStudent(PageStateSchemaStruct value) {
    insideDBStudent.remove(value);
    secureStorage.setStringList('ff_insideDBStudent',
        _insideDBStudent.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromInsideDBStudent(int index) {
    insideDBStudent.removeAt(index);
    secureStorage.setStringList('ff_insideDBStudent',
        _insideDBStudent.map((x) => x.serialize()).toList());
  }

  void updateInsideDBStudentAtIndex(
    int index,
    PageStateSchemaStruct Function(PageStateSchemaStruct) updateFn,
  ) {
    insideDBStudent[index] = updateFn(_insideDBStudent[index]);
    secureStorage.setStringList('ff_insideDBStudent',
        _insideDBStudent.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInInsideDBStudent(int index, PageStateSchemaStruct value) {
    insideDBStudent.insert(index, value);
    secureStorage.setStringList('ff_insideDBStudent',
        _insideDBStudent.map((x) => x.serialize()).toList());
  }

  PageStateSchemaStruct _pageStateSchemaVariable =
      PageStateSchemaStruct.fromSerializableMap(jsonDecode(
          '{\"inputListState\":\"[]\",\"submittedDatePlanner\":\"1735657200000\",\"dailyStartPara\":\"{\\\"CommentOfDay\\\":\\\" \\\"}\",\"basicInfoState\":\"{\\\"uid\\\":\\\"\\\"}\"}'));
  PageStateSchemaStruct get pageStateSchemaVariable => _pageStateSchemaVariable;
  set pageStateSchemaVariable(PageStateSchemaStruct value) {
    _pageStateSchemaVariable = value;
    secureStorage.setString('ff_pageStateSchemaVariable', value.serialize());
  }

  void deletePageStateSchemaVariable() {
    secureStorage.delete(key: 'ff_pageStateSchemaVariable');
  }

  void updatePageStateSchemaVariableStruct(
      Function(PageStateSchemaStruct) updateFn) {
    updateFn(_pageStateSchemaVariable);
    secureStorage.setString(
        'ff_pageStateSchemaVariable', _pageStateSchemaVariable.serialize());
  }

  PageStateSchemaStruct _changeChecker = PageStateSchemaStruct();
  PageStateSchemaStruct get changeChecker => _changeChecker;
  set changeChecker(PageStateSchemaStruct value) {
    _changeChecker = value;
    secureStorage.setString('ff_changeChecker', value.serialize());
  }

  void deleteChangeChecker() {
    secureStorage.delete(key: 'ff_changeChecker');
  }

  void updateChangeCheckerStruct(Function(PageStateSchemaStruct) updateFn) {
    updateFn(_changeChecker);
    secureStorage.setString('ff_changeChecker', _changeChecker.serialize());
  }

  DateTime? _plannerDateSelected =
      DateTime.fromMillisecondsSinceEpoch(1735657200000);
  DateTime? get plannerDateSelected => _plannerDateSelected;
  set plannerDateSelected(DateTime? value) {
    _plannerDateSelected = value;
    value != null
        ? secureStorage.setInt(
            'ff_plannerDateSelected', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_plannerDateSelected');
  }

  void deletePlannerDateSelected() {
    secureStorage.delete(key: 'ff_plannerDateSelected');
  }

  int _PlannerStartTime = 9;
  int get PlannerStartTime => _PlannerStartTime;
  set PlannerStartTime(int value) {
    _PlannerStartTime = value;
    secureStorage.setInt('ff_PlannerStartTime', value);
  }

  void deletePlannerStartTime() {
    secureStorage.delete(key: 'ff_PlannerStartTime');
  }

  int _PlannerEndTime = 22;
  int get PlannerEndTime => _PlannerEndTime;
  set PlannerEndTime(int value) {
    _PlannerEndTime = value;
    secureStorage.setInt('ff_PlannerEndTime', value);
  }

  void deletePlannerEndTime() {
    secureStorage.delete(key: 'ff_PlannerEndTime');
  }

  bool _timeIsGoing = false;
  bool get timeIsGoing => _timeIsGoing;
  set timeIsGoing(bool value) {
    _timeIsGoing = value;
    secureStorage.setBool('ff_timeIsGoing', value);
  }

  void deleteTimeIsGoing() {
    secureStorage.delete(key: 'ff_timeIsGoing');
  }

  DateTime? _TimeNow;
  DateTime? get TimeNow => _TimeNow;
  set TimeNow(DateTime? value) {
    _TimeNow = value;
  }

  int _maxNumberOfPlan = 10;
  int get maxNumberOfPlan => _maxNumberOfPlan;
  set maxNumberOfPlan(int value) {
    _maxNumberOfPlan = value;
    secureStorage.setInt('ff_maxNumberOfPlan', value);
  }

  void deleteMaxNumberOfPlan() {
    secureStorage.delete(key: 'ff_maxNumberOfPlan');
  }

  int _rapidClickAvoidCount = 0;
  int get rapidClickAvoidCount => _rapidClickAvoidCount;
  set rapidClickAvoidCount(int value) {
    _rapidClickAvoidCount = value;
    secureStorage.setInt('ff_rapidClickAvoidCount', value);
  }

  void deleteRapidClickAvoidCount() {
    secureStorage.delete(key: 'ff_rapidClickAvoidCount');
  }

  List<DDaySchemaStruct> _dDayAppState = [
    DDaySchemaStruct.fromSerializableMap(jsonDecode(
        '{\"dDay\":\"1762981200000\",\"isImportant\":\"false\",\"ddayInfo\":\"2026학년도 수능\"}'))
  ];
  List<DDaySchemaStruct> get dDayAppState => _dDayAppState;
  set dDayAppState(List<DDaySchemaStruct> value) {
    _dDayAppState = value;
    secureStorage.setStringList(
        'ff_dDayAppState', value.map((x) => x.serialize()).toList());
  }

  void deleteDDayAppState() {
    secureStorage.delete(key: 'ff_dDayAppState');
  }

  void addToDDayAppState(DDaySchemaStruct value) {
    dDayAppState.add(value);
    secureStorage.setStringList(
        'ff_dDayAppState', _dDayAppState.map((x) => x.serialize()).toList());
  }

  void removeFromDDayAppState(DDaySchemaStruct value) {
    dDayAppState.remove(value);
    secureStorage.setStringList(
        'ff_dDayAppState', _dDayAppState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDDayAppState(int index) {
    dDayAppState.removeAt(index);
    secureStorage.setStringList(
        'ff_dDayAppState', _dDayAppState.map((x) => x.serialize()).toList());
  }

  void updateDDayAppStateAtIndex(
    int index,
    DDaySchemaStruct Function(DDaySchemaStruct) updateFn,
  ) {
    dDayAppState[index] = updateFn(_dDayAppState[index]);
    secureStorage.setStringList(
        'ff_dDayAppState', _dDayAppState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDDayAppState(int index, DDaySchemaStruct value) {
    dDayAppState.insert(index, value);
    secureStorage.setStringList(
        'ff_dDayAppState', _dDayAppState.map((x) => x.serialize()).toList());
  }

  int _currentIndexIDParameter = 0;
  int get currentIndexIDParameter => _currentIndexIDParameter;
  set currentIndexIDParameter(int value) {
    _currentIndexIDParameter = value;
  }

  DateTime? _dateselectSafety =
      DateTime.fromMillisecondsSinceEpoch(1746025200000);
  DateTime? get dateselectSafety => _dateselectSafety;
  set dateselectSafety(DateTime? value) {
    _dateselectSafety = value;
    value != null
        ? secureStorage.setInt(
            'ff_dateselectSafety', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_dateselectSafety');
  }

  void deleteDateselectSafety() {
    secureStorage.delete(key: 'ff_dateselectSafety');
  }

  int _seatNoSelected = 0;
  int get seatNoSelected => _seatNoSelected;
  set seatNoSelected(int value) {
    _seatNoSelected = value;
  }

  DocumentReference? _loadedDataID;
  DocumentReference? get loadedDataID => _loadedDataID;
  set loadedDataID(DocumentReference? value) {
    _loadedDataID = value;
  }

  String _teachersNote = '';
  String get teachersNote => _teachersNote;
  set teachersNote(String value) {
    _teachersNote = value;
  }

  String _adminUserName = '';
  String get adminUserName => _adminUserName;
  set adminUserName(String value) {
    _adminUserName = value;
  }

  List<String> _spotInfoAppstate = [];
  List<String> get spotInfoAppstate => _spotInfoAppstate;
  set spotInfoAppstate(List<String> value) {
    _spotInfoAppstate = value;
  }

  void addToSpotInfoAppstate(String value) {
    spotInfoAppstate.add(value);
  }

  void removeFromSpotInfoAppstate(String value) {
    spotInfoAppstate.remove(value);
  }

  void removeAtIndexFromSpotInfoAppstate(int index) {
    spotInfoAppstate.removeAt(index);
  }

  void updateSpotInfoAppstateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    spotInfoAppstate[index] = updateFn(_spotInfoAppstate[index]);
  }

  void insertAtIndexInSpotInfoAppstate(int index, String value) {
    spotInfoAppstate.insert(index, value);
  }

  List<FixSubjectColorStruct> _fixSubjectColorAppState = [];
  List<FixSubjectColorStruct> get fixSubjectColorAppState =>
      _fixSubjectColorAppState;
  set fixSubjectColorAppState(List<FixSubjectColorStruct> value) {
    _fixSubjectColorAppState = value;
    secureStorage.setStringList(
        'ff_fixSubjectColorAppState', value.map((x) => x.serialize()).toList());
  }

  void deleteFixSubjectColorAppState() {
    secureStorage.delete(key: 'ff_fixSubjectColorAppState');
  }

  void addToFixSubjectColorAppState(FixSubjectColorStruct value) {
    fixSubjectColorAppState.add(value);
    secureStorage.setStringList('ff_fixSubjectColorAppState',
        _fixSubjectColorAppState.map((x) => x.serialize()).toList());
  }

  void removeFromFixSubjectColorAppState(FixSubjectColorStruct value) {
    fixSubjectColorAppState.remove(value);
    secureStorage.setStringList('ff_fixSubjectColorAppState',
        _fixSubjectColorAppState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFixSubjectColorAppState(int index) {
    fixSubjectColorAppState.removeAt(index);
    secureStorage.setStringList('ff_fixSubjectColorAppState',
        _fixSubjectColorAppState.map((x) => x.serialize()).toList());
  }

  void updateFixSubjectColorAppStateAtIndex(
    int index,
    FixSubjectColorStruct Function(FixSubjectColorStruct) updateFn,
  ) {
    fixSubjectColorAppState[index] = updateFn(_fixSubjectColorAppState[index]);
    secureStorage.setStringList('ff_fixSubjectColorAppState',
        _fixSubjectColorAppState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFixSubjectColorAppState(
      int index, FixSubjectColorStruct value) {
    fixSubjectColorAppState.insert(index, value);
    secureStorage.setStringList('ff_fixSubjectColorAppState',
        _fixSubjectColorAppState.map((x) => x.serialize()).toList());
  }

  List<DailyInfoEachStruct> _dailyInfoList = [
    DailyInfoEachStruct.fromSerializableMap(jsonDecode(
        '{\"starttime\":\"1729627975812\",\"endtime\":\"1729627975812\",\"colorPicked\":\"#0000\",\"subject\":\"Hello World\",\"details\":\"Hello World\",\"restinfo\":\"Hello World\"}'))
  ];
  List<DailyInfoEachStruct> get dailyInfoList => _dailyInfoList;
  set dailyInfoList(List<DailyInfoEachStruct> value) {
    _dailyInfoList = value;
  }

  void addToDailyInfoList(DailyInfoEachStruct value) {
    dailyInfoList.add(value);
  }

  void removeFromDailyInfoList(DailyInfoEachStruct value) {
    dailyInfoList.remove(value);
  }

  void removeAtIndexFromDailyInfoList(int index) {
    dailyInfoList.removeAt(index);
  }

  void updateDailyInfoListAtIndex(
    int index,
    DailyInfoEachStruct Function(DailyInfoEachStruct) updateFn,
  ) {
    dailyInfoList[index] = updateFn(_dailyInfoList[index]);
  }

  void insertAtIndexInDailyInfoList(int index, DailyInfoEachStruct value) {
    dailyInfoList.insert(index, value);
  }

  List<WeeklyTimeTableStruct> _weeklyTimeTableList = [];
  List<WeeklyTimeTableStruct> get weeklyTimeTableList => _weeklyTimeTableList;
  set weeklyTimeTableList(List<WeeklyTimeTableStruct> value) {
    _weeklyTimeTableList = value;
    secureStorage.setStringList(
        'ff_weeklyTimeTableList', value.map((x) => x.serialize()).toList());
  }

  void deleteWeeklyTimeTableList() {
    secureStorage.delete(key: 'ff_weeklyTimeTableList');
  }

  void addToWeeklyTimeTableList(WeeklyTimeTableStruct value) {
    weeklyTimeTableList.add(value);
    secureStorage.setStringList('ff_weeklyTimeTableList',
        _weeklyTimeTableList.map((x) => x.serialize()).toList());
  }

  void removeFromWeeklyTimeTableList(WeeklyTimeTableStruct value) {
    weeklyTimeTableList.remove(value);
    secureStorage.setStringList('ff_weeklyTimeTableList',
        _weeklyTimeTableList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWeeklyTimeTableList(int index) {
    weeklyTimeTableList.removeAt(index);
    secureStorage.setStringList('ff_weeklyTimeTableList',
        _weeklyTimeTableList.map((x) => x.serialize()).toList());
  }

  void updateWeeklyTimeTableListAtIndex(
    int index,
    WeeklyTimeTableStruct Function(WeeklyTimeTableStruct) updateFn,
  ) {
    weeklyTimeTableList[index] = updateFn(_weeklyTimeTableList[index]);
    secureStorage.setStringList('ff_weeklyTimeTableList',
        _weeklyTimeTableList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWeeklyTimeTableList(
      int index, WeeklyTimeTableStruct value) {
    weeklyTimeTableList.insert(index, value);
    secureStorage.setStringList('ff_weeklyTimeTableList',
        _weeklyTimeTableList.map((x) => x.serialize()).toList());
  }

  WeeklyTimeTableStruct _weeklyTimeTableChoice =
      WeeklyTimeTableStruct.fromSerializableMap(jsonDecode(
          '{\"tablename\":\"겨울방학\",\"mon\":\"{\\\"dailyoutingList\\\":\\\"[]\\\",\\\"nonExistingDate\\\":\\\"true\\\"}\",\"tue\":\"{\\\"dailyoutingList\\\":\\\"[]\\\",\\\"nonExistingDate\\\":\\\"true\\\"}\",\"wed\":\"{\\\"dailyoutingList\\\":\\\"[]\\\",\\\"nonExistingDate\\\":\\\"true\\\"}\",\"thu\":\"{\\\"dailyoutingList\\\":\\\"[]\\\",\\\"nonExistingDate\\\":\\\"true\\\"}\",\"fri\":\"{\\\"dailyoutingList\\\":\\\"[]\\\",\\\"nonExistingDate\\\":\\\"true\\\"}\",\"sat\":\"{\\\"dailyoutingList\\\":\\\"[]\\\",\\\"nonExistingDate\\\":\\\"true\\\"}\",\"sun\":\"{\\\"dailyoutingList\\\":\\\"[]\\\",\\\"nonExistingDate\\\":\\\"true\\\"}\",\"TodoObject\":\"[]\"}'));
  WeeklyTimeTableStruct get weeklyTimeTableChoice => _weeklyTimeTableChoice;
  set weeklyTimeTableChoice(WeeklyTimeTableStruct value) {
    _weeklyTimeTableChoice = value;
    secureStorage.setString('ff_weeklyTimeTableChoice', value.serialize());
  }

  void deleteWeeklyTimeTableChoice() {
    secureStorage.delete(key: 'ff_weeklyTimeTableChoice');
  }

  void updateWeeklyTimeTableChoiceStruct(
      Function(WeeklyTimeTableStruct) updateFn) {
    updateFn(_weeklyTimeTableChoice);
    secureStorage.setString(
        'ff_weeklyTimeTableChoice', _weeklyTimeTableChoice.serialize());
  }

  DateTime? _adminPickedDate;
  DateTime? get adminPickedDate => _adminPickedDate;
  set adminPickedDate(DateTime? value) {
    _adminPickedDate = value;
  }

  bool _isloading = false;
  bool get isloading => _isloading;
  set isloading(bool value) {
    _isloading = value;
  }

  String _alertReason = '';
  String get alertReason => _alertReason;
  set alertReason(String value) {
    _alertReason = value;
    secureStorage.setString('ff_alertReason', value);
  }

  void deleteAlertReason() {
    secureStorage.delete(key: 'ff_alertReason');
  }

  String _alertNumber = '';
  String get alertNumber => _alertNumber;
  set alertNumber(String value) {
    _alertNumber = value;
    secureStorage.setString('ff_alertNumber', value);
  }

  void deleteAlertNumber() {
    secureStorage.delete(key: 'ff_alertNumber');
  }

  List<PersonalSubjectEachStruct> _personalSubjectInfo = [
    PersonalSubjectEachStruct.fromSerializableMap(
        jsonDecode('{\"subject\":\"국어\",\"color\":\"#e6b58a\"}')),
    PersonalSubjectEachStruct.fromSerializableMap(
        jsonDecode('{\"subject\":\"영어\",\"color\":\"#1781e8\"}')),
    PersonalSubjectEachStruct.fromSerializableMap(
        jsonDecode('{\"subject\":\"수학\",\"color\":\"#bdd299\"}')),
    PersonalSubjectEachStruct.fromSerializableMap(
        jsonDecode('{\"subject\":\"탐구1\",\"color\":\"#e62de8\"}')),
    PersonalSubjectEachStruct.fromSerializableMap(
        jsonDecode('{\"subject\":\"탐구2\",\"color\":\"#ba84bc\"}'))
  ];
  List<PersonalSubjectEachStruct> get personalSubjectInfo =>
      _personalSubjectInfo;
  set personalSubjectInfo(List<PersonalSubjectEachStruct> value) {
    _personalSubjectInfo = value;
    secureStorage.setStringList(
        'ff_personalSubjectInfo', value.map((x) => x.serialize()).toList());
  }

  void deletePersonalSubjectInfo() {
    secureStorage.delete(key: 'ff_personalSubjectInfo');
  }

  void addToPersonalSubjectInfo(PersonalSubjectEachStruct value) {
    personalSubjectInfo.add(value);
    secureStorage.setStringList('ff_personalSubjectInfo',
        _personalSubjectInfo.map((x) => x.serialize()).toList());
  }

  void removeFromPersonalSubjectInfo(PersonalSubjectEachStruct value) {
    personalSubjectInfo.remove(value);
    secureStorage.setStringList('ff_personalSubjectInfo',
        _personalSubjectInfo.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPersonalSubjectInfo(int index) {
    personalSubjectInfo.removeAt(index);
    secureStorage.setStringList('ff_personalSubjectInfo',
        _personalSubjectInfo.map((x) => x.serialize()).toList());
  }

  void updatePersonalSubjectInfoAtIndex(
    int index,
    PersonalSubjectEachStruct Function(PersonalSubjectEachStruct) updateFn,
  ) {
    personalSubjectInfo[index] = updateFn(_personalSubjectInfo[index]);
    secureStorage.setStringList('ff_personalSubjectInfo',
        _personalSubjectInfo.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPersonalSubjectInfo(
      int index, PersonalSubjectEachStruct value) {
    personalSubjectInfo.insert(index, value);
    secureStorage.setStringList('ff_personalSubjectInfo',
        _personalSubjectInfo.map((x) => x.serialize()).toList());
  }

  String _teachersQuoteToInsert = '';
  String get teachersQuoteToInsert => _teachersQuoteToInsert;
  set teachersQuoteToInsert(String value) {
    _teachersQuoteToInsert = value;
  }

  bool _updateCheckBool = false;
  bool get updateCheckBool => _updateCheckBool;
  set updateCheckBool(bool value) {
    _updateCheckBool = value;
    secureStorage.setBool('ff_updateCheckBool', value);
  }

  void deleteUpdateCheckBool() {
    secureStorage.delete(key: 'ff_updateCheckBool');
  }

  DateTime? _startdate;
  DateTime? get startdate => _startdate;
  set startdate(DateTime? value) {
    _startdate = value;
  }

  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  set enddate(DateTime? value) {
    _enddate = value;
  }

  CrashBackUpDataStruct _crashBackupData = CrashBackUpDataStruct();
  CrashBackUpDataStruct get crashBackupData => _crashBackupData;
  set crashBackupData(CrashBackUpDataStruct value) {
    _crashBackupData = value;
    secureStorage.setString('ff_crashBackupData', value.serialize());
  }

  void deleteCrashBackupData() {
    secureStorage.delete(key: 'ff_crashBackupData');
  }

  void updateCrashBackupDataStruct(Function(CrashBackUpDataStruct) updateFn) {
    updateFn(_crashBackupData);
    secureStorage.setString('ff_crashBackupData', _crashBackupData.serialize());
  }

  bool _crashed = false;
  bool get crashed => _crashed;
  set crashed(bool value) {
    _crashed = value;
  }

  int _updateChatNum = 2;
  int get updateChatNum => _updateChatNum;
  set updateChatNum(int value) {
    _updateChatNum = value;
    secureStorage.setInt('ff_updateChatNum', value);
  }

  void deleteUpdateChatNum() {
    secureStorage.delete(key: 'ff_updateChatNum');
  }

  int _setnum = 0;
  int get setnum => _setnum;
  set setnum(int value) {
    _setnum = value;
  }

  bool _popupMainPage = false;
  bool get popupMainPage => _popupMainPage;
  set popupMainPage(bool value) {
    _popupMainPage = value;
    secureStorage.setBool('ff_popupMainPage', value);
  }

  void deletePopupMainPage() {
    secureStorage.delete(key: 'ff_popupMainPage');
  }

  String _selectedTime = '';
  String get selectedTime => _selectedTime;
  set selectedTime(String value) {
    _selectedTime = value;
  }

  bool _newCallOnPlanner = false;
  bool get newCallOnPlanner => _newCallOnPlanner;
  set newCallOnPlanner(bool value) {
    _newCallOnPlanner = value;
    secureStorage.setBool('ff_newCallOnPlanner', value);
  }

  void deleteNewCallOnPlanner() {
    secureStorage.delete(key: 'ff_newCallOnPlanner');
  }

  List<ConvertCostCallPerSpotStruct> _costCallList = [];
  List<ConvertCostCallPerSpotStruct> get costCallList => _costCallList;
  set costCallList(List<ConvertCostCallPerSpotStruct> value) {
    _costCallList = value;
  }

  void addToCostCallList(ConvertCostCallPerSpotStruct value) {
    costCallList.add(value);
  }

  void removeFromCostCallList(ConvertCostCallPerSpotStruct value) {
    costCallList.remove(value);
  }

  void removeAtIndexFromCostCallList(int index) {
    costCallList.removeAt(index);
  }

  void updateCostCallListAtIndex(
    int index,
    ConvertCostCallPerSpotStruct Function(ConvertCostCallPerSpotStruct)
        updateFn,
  ) {
    costCallList[index] = updateFn(_costCallList[index]);
  }

  void insertAtIndexInCostCallList(
      int index, ConvertCostCallPerSpotStruct value) {
    costCallList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
