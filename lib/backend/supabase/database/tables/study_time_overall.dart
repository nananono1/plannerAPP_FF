import '../database.dart';

class StudyTimeOverallTable extends SupabaseTable<StudyTimeOverallRow> {
  @override
  String get tableName => 'studyTime_Overall';

  @override
  StudyTimeOverallRow createRow(Map<String, dynamic> data) =>
      StudyTimeOverallRow(data);
}

class StudyTimeOverallRow extends SupabaseDataRow {
  StudyTimeOverallRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StudyTimeOverallTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  String get spot => getField<String>('spot')!;
  set spot(String value) => setField<String>('spot', value);

  DateTime get studyDate => getField<DateTime>('study_date')!;
  set studyDate(DateTime value) => setField<DateTime>('study_date', value);

  int get studyTimeOfDay => getField<int>('study_time_of_day')!;
  set studyTimeOfDay(int value) => setField<int>('study_time_of_day', value);

  int get studyInsideOfDay => getField<int>('study_inside_of_day')!;
  set studyInsideOfDay(int value) =>
      setField<int>('study_inside_of_day', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
