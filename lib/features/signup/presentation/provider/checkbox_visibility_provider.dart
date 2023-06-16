import 'package:flutter/material.dart';

class CheckBoxVisibilityProvider with ChangeNotifier {
  bool _value = false;
  bool get value => _value;
  bool _showError = false;
  bool get showError => _showError;

  void toggelCheckBox() {
    _value = !value;
    _showError = false;
    notifyListeners();
  }

  void showErrors() {
    _showError = true;
    notifyListeners();
  }

  void hideErrors() {
    _showError = false;
    notifyListeners();
  }
}
