class Validator {
  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    if (value.length < 8) {
      return 'Password Atlest 8 digits';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    return null;
  }
}
