import 'package:flutter/material.dart';
import 'package:flutter_study/feature/login/presentation/controller/login_form_controller.dart';

import '../controller/form_validator_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FormValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  final LoginFormController _loginFormController = LoginFormController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (value) => {
                                _loginFormController.setUsername(value),
                                setState(() {
                                  bool isValid =
                                      _formKey.currentState?.validate() ??
                                          false;

                                  _loginFormController.validate(isValid);
                                }),
                              },
                              validator: validateUsername,
                              decoration: const InputDecoration(
                                labelText: "Usuário",
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (value) {
                                _loginFormController.setPassword(value);
                                setState(() {
                                  bool isValid =
                                      _formKey.currentState?.validate() ??
                                          false;

                                  _loginFormController.validate(isValid);
                                });
                              },
                              validator: validatePassword,
                              decoration: const InputDecoration(
                                labelText: "Senha",
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: _loginFormController.isFormValid
                                        ? () => ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Processando Dados. \nUsuário: ${_loginFormController.username} \nSenha: ${_loginFormController.password}',
                                                ),
                                              ),
                                            )
                                        : null,
                                    child: const Text('Enviar'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
