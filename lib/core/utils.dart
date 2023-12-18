import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/feature/login/domain/entities/login_input_entity.dart';
import 'package:flutter_study/feature/login/domain/use_cases/save_credentials_use_case.dart';
import 'package:flutter_study/main.dart';

class Utils {
  static void showSaveCredentialsDialog({
    required SaveCredentialsUseCase saveCredentialsUseCase,
    required LoginInputEntity credentials,
  }) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Salvar Credenciais')),
          content: const Text(
            'Você deseja salvar suas credenciais?',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Não'),
              onPressed: () {
                Modular.to.navigate("/home");
              },
            ),
            ElevatedButton(
              child: const Text('Sim'),
              onPressed: () {
                saveCredentialsUseCase.call(
                  key: "login_credentials",
                  credentials: credentials,
                );
                Modular.to.navigate("/home");
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceAround,
        );
      },
    );
  }
}
