import 'package:flutter/material.dart';

import '../controllers/login_submit_controller.dart';
import 'form_title_widget.dart';
import 'login_form_widget.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({
    super.key,
    required this.controller,
  });

  final LoginSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const FormTitleWidget(),
            LoginFormWidget(loginController: controller),
          ],
        ),
      ),
    );
  }
}