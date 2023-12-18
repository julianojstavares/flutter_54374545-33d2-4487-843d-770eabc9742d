import 'package:flutter/material.dart';
import 'package:flutter_study/core/utils.dart';
import 'package:flutter_study/core/domain/entities/login_input_entity.dart';
import 'package:flutter_study/feature/login/domain/use_cases/login_use_case.dart';
import 'package:flutter_study/feature/login/domain/use_cases/save_credentials_use_case.dart';

import '../states/login_submit_state.dart';

class LoginSubmitController extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final SaveCredentialsUseCase _saveCredentialsUseCase;

  LoginSubmitState _state = LoginSubmitInitial();

  LoginSubmitController({
    required LoginUseCase loginUseCase,
    required SaveCredentialsUseCase saveCredentialsUseCase,
  })  : _loginUseCase = loginUseCase,
        _saveCredentialsUseCase = saveCredentialsUseCase;

  LoginSubmitState get state => _state;

  Future<void> submitLogin(
    String username,
    String password,
  ) async {
    _state = LoginSubmitLoading();
    notifyListeners();

    try {
      final input = LoginInputEntity(
        username: username,
        password: password,
      );
      await _loginUseCase.execute(input);
      Utils.showSaveCredentialsDialog(
        saveCredentialsUseCase: _saveCredentialsUseCase,
        credentials: input,
      );
    } catch (e) {
      _state = LoginSubmitError(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
