import 'package:email_validator/email_validator.dart';

extension StringExtensions on String? {
  String orEmpty() => this ?? '';

  bool isNullOrEmpty() {
    if (this?.trim() == null) {
      return true;
    } else {
      if (this?.trim() == '') {
        return true;
      } else {
        return false;
      }
    }
  }

  bool isValidEmail() {
    return EmailValidator.validate(this ?? '');
  }

  bool isNumeric() {
    final numericRegex = RegExp(r'^-?([0-9]+|([0-9]*\.[0-9]+))$');
    return numericRegex.hasMatch(this ?? '');
  }
}

extension IntExtensions on int? {
  int orEmpty() => this ?? 0;
}

extension DoubleExtensions on double? {
  double orEmpty() => this ?? 0;
}
