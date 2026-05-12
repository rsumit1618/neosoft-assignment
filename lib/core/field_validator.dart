import 'package:assignment_one/core/extentions.dart';
import 'package:assignment_one/core/value_objects.dart';

class InputFieldOne extends ValueObjects<String> {
  @override
  bool isValid() => value.isNotEmpty && value.length > 0;

  @override
  final String value;

  factory InputFieldOne(String? input) {
    assert(input != null);

    return InputFieldOne._(input!);
  }

  const InputFieldOne._(this.value);
}

class EmailAddress extends ValueObjects<String> {
  @override
  bool isValid() => value.isNotEmpty && value.isEmailAddress;

  @override
  final String value;

  factory EmailAddress(String? input) {
    assert(input != null);

    return EmailAddress._(input!);
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObjects<String> {
  @override
  bool isValid() => value.isNotEmpty && value.isValidPassword;

  @override
  final String value;

  factory Password(String? input) {
    assert(input != null);

    return Password._(input!);
  }

  const Password._(this.value);
}

class PhoneNumber extends ValueObjects<String> {
  @override
  bool isValid() =>
      value.isNotEmpty && double.tryParse(value) != null && value.length == 10;

  @override
  final String value;

  factory PhoneNumber(String? input) {
    assert(input != null);

    return PhoneNumber._(input!);
  }

  const PhoneNumber._(this.value);
}
