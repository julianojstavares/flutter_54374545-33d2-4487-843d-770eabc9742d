import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/core/presentation/controller/credentials_controller.dart';
import 'package:flutter_study/core/domain/entities/login_input_entity.dart';
import 'package:flutter_study/feature/home/domain/use_cases/clear_credentials_use_case.dart';
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
                final input = Modular.get<CredentialsControler>();
                input.save(credentials);
                Modular.to.navigate("/home/");
              },
            ),
            ElevatedButton(
              child: const Text('Sim'),
              onPressed: () async {
                await saveCredentialsUseCase.call(
                  key: "login_credentials",
                  credentials: credentials,
                );
                Modular.to.navigate("/home/");
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceAround,
        );
      },
    );
  }
  static void showClearCredentialsDialog({
    required ClearCredentialsUseCase clearCredentialsUseCase,
  }) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Apagar Credenciais')),
          content: const Text(
            'Você confirma a remoção das suas credenciais?',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Sim'),
              onPressed: () async {
                await clearCredentialsUseCase.call(
                  key: "login_credentials",
                );
                Modular.to.navigate("/login/");
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceAround,
        );
      },
    );
  }
}
