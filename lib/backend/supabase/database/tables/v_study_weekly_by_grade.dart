import '../database.dart';

class VStudyWeeklyByGradeTable extends SupabaseTable<VStudyWeeklyByGradeRow> {
  @override
  String get tableName => 'v_study_weekly_by_grade';

  @override
  VStudyWeeklyByGradeRow createRow(Map<String, dynamic> data) =>
      VStudyWeeklyByGradeRow(data);
}

class VStudyWeeklyByGradeRow extends SupabaseDataRow {
  VStudyWeeklyByGradeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VStudyWeeklyByGradeTable();

  DateTime? get weekStart => getField<DateTime>('week_start');
  set weekStart(DateTime? value) => setField<DateTime>('week_start', value);

  String? get grade => getField<String>('grade');
  set grade(String? value) => setField<String>('grade', value);

  double? get totalStudyMinute => getField<double>('total_study_minute');
  set totalStudyMinute(double? value) =>
      setField<double>('total_study_minute', value);

  double? get totalInsideMinute => getField<double>('total_inside_minute');
  set totalInsideMinute(double? value) =>
      setField<double>('total_inside_minute', value);

  int? get studentDays => getField<int>('student_days');
  set studentDays(int? value) => setField<int>('student_days', value);

  int? get uniqueStudents => getField<int>('unique_students');
  set uniqueStudents(int? value) => setField<int>('unique_students', value);

  double? get avgMinPerStudent => getField<double>('avg_min_per_student');
  set avgMinPerStudent(double? value) =>
      setField<double>('avg_min_per_student', value);

  double? get avgMinPerStudentDay =>
      getField<double>('avg_min_per_student_day');
  set avgMinPerStudentDay(double? value) =>
      setField<double>('avg_min_per_student_day', value);
}
