import 'dart:async';

abstract class ValueObjects<T> {
  const ValueObjects();

  T get value;

  FutureOr<bool> isValid();

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObjects<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
