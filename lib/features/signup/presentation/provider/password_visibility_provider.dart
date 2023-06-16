import 'package:flutter/material.dart';

class PasswordVisibilityProvider with ChangeNotifier {
  bool _isPasswordVisible = false;
  bool _value = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get value => _value;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggelCheckBox() {
    _value = !value;
    notifyListeners();
  }
}
