import '../database.dart';

class VStudyEnrichedTable extends SupabaseTable<VStudyEnrichedRow> {
  @override
  String get tableName => 'v_study_enriched';

  @override
  VStudyEnrichedRow createRow(Map<String, dynamic> data) =>
      VStudyEnrichedRow(data);
}

class VStudyEnrichedRow extends SupabaseDataRow {
  VStudyEnrichedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VStudyEnrichedTable();

  String? get uid => getField<String>('uid');
  set uid(String? value) => setField<String>('uid', value);

  String? get spot => getField<String>('spot');
  set spot(String? value) => setField<String>('spot', value);

  DateTime? get studyDate => getField<DateTime>('study_date');
  set studyDate(DateTime? value) => setField<DateTime>('study_date', value);

  int? get studyTimeOfDay => getField<int>('study_time_of_day');
  set studyTimeOfDay(int? value) => setField<int>('study_time_of_day', value);

  int? get studyInsideOfDay => getField<int>('study_inside_of_day');
  set studyInsideOfDay(int? value) =>
      setField<int>('study_inside_of_day', value);

  String? get school => getField<String>('school');
  set school(String? value) => setField<String>('school', value);

  String? get grade => getField<String>('grade');
  set grade(String? value) => setField<String>('grade', value);

  String? get forwhat => getField<String>('forwhat');
  set forwhat(String? value) => setField<String>('forwhat', value);
}
