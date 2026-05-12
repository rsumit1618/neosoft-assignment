extension InputFields on String {
  bool get isEmailAddress {
    String emailAddress = this;
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    return RegExp(emailRegex).hasMatch(emailAddress);
  }
}

extension PasswordFields on String {
  bool get isValidPassword {
    String password = this;
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }
}
