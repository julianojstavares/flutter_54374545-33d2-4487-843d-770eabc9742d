import 'package:flutter/foundation.dart';
import 'package:flutter_study/core/domain/entities/login_input_entity.dart';

class CredentialsControler extends ChangeNotifier {
  LoginInputEntity _credentials = const LoginInputEntity(
    username: "null",
    password: "null",
  );

  LoginInputEntity get credentials => _credentials;

  save(LoginInputEntity credentials) {
    _credentials = credentials;
    notifyListeners();
  }
}
