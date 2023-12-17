import 'package:flutter/material.dart';

class LoginFormController extends ChangeNotifier {
  String _username = '';
  String _password = '';
  bool _isFormValid = false;

  String get username => _username;
  String get password => _password;
  bool get isFormValid => _isFormValid;  

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void validate(bool isValid) {
    _isFormValid = isValid;
    notifyListeners();
  }
}
