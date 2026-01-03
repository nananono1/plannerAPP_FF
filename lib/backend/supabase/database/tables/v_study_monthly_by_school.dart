import '../database.dart';

class VStudyMonthlyBySchoolTable
    extends SupabaseTable<VStudyMonthlyBySchoolRow> {
  @override
  String get tableName => 'v_study_monthly_by_school';

  @override
  VStudyMonthlyBySchoolRow createRow(Map<String, dynamic> data) =>
      VStudyMonthlyBySchoolRow(data);
}

class VStudyMonthlyBySchoolRow extends SupabaseDataRow {
  VStudyMonthlyBySchoolRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VStudyMonthlyBySchoolTable();

  DateTime? get monthStart => getField<DateTime>('month_start');
  set monthStart(DateTime? value) => setField<DateTime>('month_start', value);

  String? get school => getField<String>('school');
  set school(String? value) => setField<String>('school', value);

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
