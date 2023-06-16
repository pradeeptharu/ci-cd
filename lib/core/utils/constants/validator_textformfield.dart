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

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!validatePassword(value)) {
      return 'Invalid Password';
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
}
