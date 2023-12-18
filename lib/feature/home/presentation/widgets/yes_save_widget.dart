import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/core/utils.dart';
import 'package:flutter_study/feature/home/domain/use_cases/clear_credentials_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YesSaveWidget extends StatelessWidget {
  const YesSaveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final prefs = Modular.get<SharedPreferences>();
    final credentials = prefs.getStringList("login_credentials");
    final username = credentials?[0];
    final password = credentials?[1];

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Os dados abaixo foram salvos usando \nShared Preferences:",
                      style: theme.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text("Usuário: $username"),
                    Text("Senha: $password"),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: () => Utils.showClearCredentialsDialog(
                              clearCredentialsUseCase:
                                  Modular.get<ClearCredentialsUseCase>(),
                            ),
                            child: const Text("Apagar dados"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
