import '../database.dart';

class StudentProfileTable extends SupabaseTable<StudentProfileRow> {
  @override
  String get tableName => 'student_profile';

  @override
  StudentProfileRow createRow(Map<String, dynamic> data) =>
      StudentProfileRow(data);
}

class StudentProfileRow extends SupabaseDataRow {
  StudentProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StudentProfileTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  String get forwhat => getField<String>('forwhat')!;
  set forwhat(String value) => setField<String>('forwhat', value);

  String get grade => getField<String>('grade')!;
  set grade(String value) => setField<String>('grade', value);

  String get school => getField<String>('school')!;
  set school(String value) => setField<String>('school', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
