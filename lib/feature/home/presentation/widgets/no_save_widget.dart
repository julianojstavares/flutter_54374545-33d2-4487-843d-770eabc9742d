import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/presentation/controller/credentials_controller.dart';

class NoSaveWidget extends StatelessWidget {
  const NoSaveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final input = Modular.get<CredentialsControler>();
    final username = input.credentials.username;
    final password = input.credentials.password;

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              "Olá! Você digitou estes dados no formulário de login:",
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
                                    onPressed: () =>
                                        Modular.to.navigate("/login/"),
                                    child: const Text(
                                        "Voltar para a tela de login"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
