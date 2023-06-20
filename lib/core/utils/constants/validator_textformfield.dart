import 'package:qa_lint/core/utils/constants/validator.dart';

class Validator {
  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    if (!validatePhoneNumber(value)) {
      return 'Invalid Phone Number';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!validateEmail(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Minimum password length is 8';
    }

    if (!password.contains(RegExp(r'[!@#\$&*~]'))) {
      return 'At least one special character (ex.!@#\$&*~) is required';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'At least one uppercase(ex.ABC) letter is required';
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'At least one lowercase(abc) letter is required';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'At least one number(ex.123) is required';
    }

    return null;
  }

  String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'First Name is required';
    }
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last Name is required';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!validatePassword(value)) {
      return 'Invalid Password';
    }
    return null;
  }
}
