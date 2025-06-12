import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "school" field.
  String? _school;
  String get school => _school ?? '';
  bool hasSchool() => _school != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "IsAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "forWhat" field.
  String? _forWhat;
  String get forWhat => _forWhat ?? '';
  bool hasForWhat() => _forWhat != null;

  // "seatNo" field.
  int? _seatNo;
  int get seatNo => _seatNo ?? 0;
  bool hasSeatNo() => _seatNo != null;

  // "seatRequest" field.
  bool? _seatRequest;
  bool get seatRequest => _seatRequest ?? false;
  bool hasSeatRequest() => _seatRequest != null;

  // "totalPoint" field.
  int? _totalPoint;
  int get totalPoint => _totalPoint ?? 0;
  bool hasTotalPoint() => _totalPoint != null;

  // "pointListEach" field.
  List<PointInputStruct>? _pointListEach;
  List<PointInputStruct> get pointListEach => _pointListEach ?? const [];
  bool hasPointListEach() => _pointListEach != null;

  // "weeklyPointEach" field.
  int? _weeklyPointEach;
  int get weeklyPointEach => _weeklyPointEach ?? 0;
  bool hasWeeklyPointEach() => _weeklyPointEach != null;

  // "monthlyPointEach" field.
  int? _monthlyPointEach;
  int get monthlyPointEach => _monthlyPointEach ?? 0;
  bool hasMonthlyPointEach() => _monthlyPointEach != null;

  // "spot" field.
  String? _spot;
  String get spot => _spot ?? '';
  bool hasSpot() => _spot != null;

  // "secondPin" field.
  int? _secondPin;
  int get secondPin => _secondPin ?? 0;
  bool hasSecondPin() => _secondPin != null;

  // "rankOpen" field.
  bool? _rankOpen;
  bool get rankOpen => _rankOpen ?? false;
  bool hasRankOpen() => _rankOpen != null;

  // "studyDBbackup" field.
  List<PageStateSchemaStruct>? _studyDBbackup;
  List<PageStateSchemaStruct> get studyDBbackup => _studyDBbackup ?? const [];
  bool hasStudyDBbackup() => _studyDBbackup != null;

  // "scheduleNow" field.
  WeeklyTimeTableStruct? _scheduleNow;
  WeeklyTimeTableStruct get scheduleNow =>
      _scheduleNow ?? WeeklyTimeTableStruct();
  bool hasScheduleNow() => _scheduleNow != null;

  // "scheduleToChange" field.
  WeeklyTimeTableStruct? _scheduleToChange;
  WeeklyTimeTableStruct get scheduleToChange =>
      _scheduleToChange ?? WeeklyTimeTableStruct();
  bool hasScheduleToChange() => _scheduleToChange != null;

  // "scheduleChangeRequest" field.
  bool? _scheduleChangeRequest;
  bool get scheduleChangeRequest => _scheduleChangeRequest ?? false;
  bool hasScheduleChangeRequest() => _scheduleChangeRequest != null;

  // "updateChecker" field.
  bool? _updateChecker;
  bool get updateChecker => _updateChecker ?? false;
  bool hasUpdateChecker() => _updateChecker != null;

  // "popupmainPage" field.
  bool? _popupmainPage;
  bool get popupmainPage => _popupmainPage ?? false;
  bool hasPopupmainPage() => _popupmainPage != null;

  // "latestSubmittedDate" field.
  DateTime? _latestSubmittedDate;
  DateTime? get latestSubmittedDate => _latestSubmittedDate;
  bool hasLatestSubmittedDate() => _latestSubmittedDate != null;

  // "hasLocked" field.
  bool? _hasLocked;
  bool get hasLocked => _hasLocked ?? false;
  bool hasHasLocked() => _hasLocked != null;

  // "personalSubjectInfo" field.
  List<PersonalSubjectEachStruct>? _personalSubjectInfo;
  List<PersonalSubjectEachStruct> get personalSubjectInfo =>
      _personalSubjectInfo ?? const [];
  bool hasPersonalSubjectInfo() => _personalSubjectInfo != null;

  // "pw" field.
  String? _pw;
  String get pw => _pw ?? '';
  bool hasPw() => _pw != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "parentsPhone1" field.
  String? _parentsPhone1;
  String get parentsPhone1 => _parentsPhone1 ?? '';
  bool hasParentsPhone1() => _parentsPhone1 != null;

  // "parentsPhone2" field.
  String? _parentsPhone2;
  String get parentsPhone2 => _parentsPhone2 ?? '';
  bool hasParentsPhone2() => _parentsPhone2 != null;

  // "studyDetails" field.
  StudyDetailsStruct? _studyDetails;
  StudyDetailsStruct get studyDetails => _studyDetails ?? StudyDetailsStruct();
  bool hasStudyDetails() => _studyDetails != null;

  // "signedUser" field.
  bool? _signedUser;
  bool get signedUser => _signedUser ?? false;
  bool hasSignedUser() => _signedUser != null;

  // "scheduleRequestTime" field.
  DateTime? _scheduleRequestTime;
  DateTime? get scheduleRequestTime => _scheduleRequestTime;
  bool hasScheduleRequestTime() => _scheduleRequestTime != null;

  // "idAllowed" field.
  bool? _idAllowed;
  bool get idAllowed => _idAllowed ?? false;
  bool hasIdAllowed() => _idAllowed != null;

  // "grade" field.
  String? _grade;
  String get grade => _grade ?? '';
  bool hasGrade() => _grade != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _school = snapshotData['school'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _isAdmin = snapshotData['IsAdmin'] as bool?;
    _uid = snapshotData['uid'] as String?;
    _forWhat = snapshotData['forWhat'] as String?;
    _seatNo = castToType<int>(snapshotData['seatNo']);
    _seatRequest = snapshotData['seatRequest'] as bool?;
    _totalPoint = castToType<int>(snapshotData['totalPoint']);
    _pointListEach = getStructList(
      snapshotData['pointListEach'],
      PointInputStruct.fromMap,
    );
    _weeklyPointEach = castToType<int>(snapshotData['weeklyPointEach']);
    _monthlyPointEach = castToType<int>(snapshotData['monthlyPointEach']);
    _spot = snapshotData['spot'] as String?;
    _secondPin = castToType<int>(snapshotData['secondPin']);
    _rankOpen = snapshotData['rankOpen'] as bool?;
    _studyDBbackup = getStructList(
      snapshotData['studyDBbackup'],
      PageStateSchemaStruct.fromMap,
    );
    _scheduleNow = snapshotData['scheduleNow'] is WeeklyTimeTableStruct
        ? snapshotData['scheduleNow']
        : WeeklyTimeTableStruct.maybeFromMap(snapshotData['scheduleNow']);
    _scheduleToChange = snapshotData['scheduleToChange']
            is WeeklyTimeTableStruct
        ? snapshotData['scheduleToChange']
        : WeeklyTimeTableStruct.maybeFromMap(snapshotData['scheduleToChange']);
    _scheduleChangeRequest = snapshotData['scheduleChangeRequest'] as bool?;
    _updateChecker = snapshotData['updateChecker'] as bool?;
    _popupmainPage = snapshotData['popupmainPage'] as bool?;
    _latestSubmittedDate = snapshotData['latestSubmittedDate'] as DateTime?;
    _hasLocked = snapshotData['hasLocked'] as bool?;
    _personalSubjectInfo = getStructList(
      snapshotData['personalSubjectInfo'],
      PersonalSubjectEachStruct.fromMap,
    );
    _pw = snapshotData['pw'] as String?;
    _address = snapshotData['address'] as String?;
    _parentsPhone1 = snapshotData['parentsPhone1'] as String?;
    _parentsPhone2 = snapshotData['parentsPhone2'] as String?;
    _studyDetails = snapshotData['studyDetails'] is StudyDetailsStruct
        ? snapshotData['studyDetails']
        : StudyDetailsStruct.maybeFromMap(snapshotData['studyDetails']);
    _signedUser = snapshotData['signedUser'] as bool?;
    _scheduleRequestTime = snapshotData['scheduleRequestTime'] as DateTime?;
    _idAllowed = snapshotData['idAllowed'] as bool?;
    _grade = snapshotData['grade'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? birthday,
  String? school,
  String? photoUrl,
  bool? isAdmin,
  String? uid,
  String? forWhat,
  int? seatNo,
  bool? seatRequest,
  int? totalPoint,
  int? weeklyPointEach,
  int? monthlyPointEach,
  String? spot,
  int? secondPin,
  bool? rankOpen,
  WeeklyTimeTableStruct? scheduleNow,
  WeeklyTimeTableStruct? scheduleToChange,
  bool? scheduleChangeRequest,
  bool? updateChecker,
  bool? popupmainPage,
  DateTime? latestSubmittedDate,
  bool? hasLocked,
  String? pw,
  String? address,
  String? parentsPhone1,
  String? parentsPhone2,
  StudyDetailsStruct? studyDetails,
  bool? signedUser,
  DateTime? scheduleRequestTime,
  bool? idAllowed,
  String? grade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'birthday': birthday,
      'school': school,
      'photo_url': photoUrl,
      'IsAdmin': isAdmin,
      'uid': uid,
      'forWhat': forWhat,
      'seatNo': seatNo,
      'seatRequest': seatRequest,
      'totalPoint': totalPoint,
      'weeklyPointEach': weeklyPointEach,
      'monthlyPointEach': monthlyPointEach,
      'spot': spot,
      'secondPin': secondPin,
      'rankOpen': rankOpen,
      'scheduleNow': WeeklyTimeTableStruct().toMap(),
      'scheduleToChange': WeeklyTimeTableStruct().toMap(),
      'scheduleChangeRequest': scheduleChangeRequest,
      'updateChecker': updateChecker,
      'popupmainPage': popupmainPage,
      'latestSubmittedDate': latestSubmittedDate,
      'hasLocked': hasLocked,
      'pw': pw,
      'address': address,
      'parentsPhone1': parentsPhone1,
      'parentsPhone2': parentsPhone2,
      'studyDetails': StudyDetailsStruct().toMap(),
      'signedUser': signedUser,
      'scheduleRequestTime': scheduleRequestTime,
      'idAllowed': idAllowed,
      'grade': grade,
    }.withoutNulls,
  );

  // Handle nested data for "scheduleNow" field.
  addWeeklyTimeTableStructData(firestoreData, scheduleNow, 'scheduleNow');

  // Handle nested data for "scheduleToChange" field.
  addWeeklyTimeTableStructData(
      firestoreData, scheduleToChange, 'scheduleToChange');

  // Handle nested data for "studyDetails" field.
  addStudyDetailsStructData(firestoreData, studyDetails, 'studyDetails');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthday == e2?.birthday &&
        e1?.school == e2?.school &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.uid == e2?.uid &&
        e1?.forWhat == e2?.forWhat &&
        e1?.seatNo == e2?.seatNo &&
        e1?.seatRequest == e2?.seatRequest &&
        e1?.totalPoint == e2?.totalPoint &&
        listEquality.equals(e1?.pointListEach, e2?.pointListEach) &&
        e1?.weeklyPointEach == e2?.weeklyPointEach &&
        e1?.monthlyPointEach == e2?.monthlyPointEach &&
        e1?.spot == e2?.spot &&
        e1?.secondPin == e2?.secondPin &&
        e1?.rankOpen == e2?.rankOpen &&
        listEquality.equals(e1?.studyDBbackup, e2?.studyDBbackup) &&
        e1?.scheduleNow == e2?.scheduleNow &&
        e1?.scheduleToChange == e2?.scheduleToChange &&
        e1?.scheduleChangeRequest == e2?.scheduleChangeRequest &&
        e1?.updateChecker == e2?.updateChecker &&
        e1?.popupmainPage == e2?.popupmainPage &&
        e1?.latestSubmittedDate == e2?.latestSubmittedDate &&
        e1?.hasLocked == e2?.hasLocked &&
        listEquality.equals(e1?.personalSubjectInfo, e2?.personalSubjectInfo) &&
        e1?.pw == e2?.pw &&
        e1?.address == e2?.address &&
        e1?.parentsPhone1 == e2?.parentsPhone1 &&
        e1?.parentsPhone2 == e2?.parentsPhone2 &&
        e1?.studyDetails == e2?.studyDetails &&
        e1?.signedUser == e2?.signedUser &&
        e1?.scheduleRequestTime == e2?.scheduleRequestTime &&
        e1?.idAllowed == e2?.idAllowed &&
        e1?.grade == e2?.grade;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.birthday,
        e?.school,
        e?.photoUrl,
        e?.isAdmin,
        e?.uid,
        e?.forWhat,
        e?.seatNo,
        e?.seatRequest,
        e?.totalPoint,
        e?.pointListEach,
        e?.weeklyPointEach,
        e?.monthlyPointEach,
        e?.spot,
        e?.secondPin,
        e?.rankOpen,
        e?.studyDBbackup,
        e?.scheduleNow,
        e?.scheduleToChange,
        e?.scheduleChangeRequest,
        e?.updateChecker,
        e?.popupmainPage,
        e?.latestSubmittedDate,
        e?.hasLocked,
        e?.personalSubjectInfo,
        e?.pw,
        e?.address,
        e?.parentsPhone1,
        e?.parentsPhone2,
        e?.studyDetails,
        e?.signedUser,
        e?.scheduleRequestTime,
        e?.idAllowed,
        e?.grade
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
