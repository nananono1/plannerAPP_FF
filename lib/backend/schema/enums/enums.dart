import 'package:collection/collection.dart';

enum StuduDoneStatus {
  all,
  half,
  no,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (StuduDoneStatus):
      return StuduDoneStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
