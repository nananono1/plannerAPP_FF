import '../database.dart';

class VStudyTimeDailyBySpotTable
    extends SupabaseTable<VStudyTimeDailyBySpotRow> {
  @override
  String get tableName => 'v_study_time_daily_by_spot';

  @override
  VStudyTimeDailyBySpotRow createRow(Map<String, dynamic> data) =>
      VStudyTimeDailyBySpotRow(data);
}

class VStudyTimeDailyBySpotRow extends SupabaseDataRow {
  VStudyTimeDailyBySpotRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VStudyTimeDailyBySpotTable();

  DateTime? get studyDate => getField<DateTime>('study_date');
  set studyDate(DateTime? value) => setField<DateTime>('study_date', value);

  String? get spot => getField<String>('spot');
  set spot(String? value) => setField<String>('spot', value);

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
