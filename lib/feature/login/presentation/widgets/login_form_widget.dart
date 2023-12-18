import 'package:flutter/material.dart';

import '../controllers/form_validator_mixin.dart';
import '../controllers/login_form_controller.dart';
import '../controllers/login_submit_controller.dart';

class LoginFormWidget extends StatefulWidget {
  final LoginSubmitController loginController;
  const LoginFormWidget({super.key, required this.loginController});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget>
    with FormValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  final _loginFormController = LoginFormController();

  @override
  Widget build(BuildContext context) {
    final controller = widget.loginController;

    return ListenableBuilder(
      listenable: _loginFormController,
      builder: (context, child) => Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) =>
                  _loginFormController.updateUsernameAndFormState(
                value,
                _formKey,
              ),
              validator: validateUsername,
              decoration: const InputDecoration(
                labelText: "Usuário",
              ),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) =>
                  _loginFormController.updatePasswordAndFormState(
                value,
                _formKey,
              ),
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
                        ? () => controller.submitLogin(
                              _loginFormController.username,
                              _loginFormController.password,
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
    );
  }
}
