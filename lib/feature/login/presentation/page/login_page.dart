import 'package:flutter/material.dart';
import 'package:flutter_study/feature/login/presentation/controllers/login_submit_controller.dart';
import 'package:flutter_study/feature/login/presentation/states/login_submit_state.dart';

import '../widgets/login_card_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginSubmitController controller;

  const LoginPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ListenableBuilder(
                  listenable: controller,
                  builder: (context, child) {
                    switch (controller.state) {
                      case LoginSubmitInitial():
                        return LoginCardWidget(controller: controller);
                      case LoginSubmitLoading():
                        return const CircularProgressIndicator();
                      case LoginSubmitError():
                        final state = controller.state;
                        final loginError = (state as LoginSubmitError);
                        return Text(
                          "[Login Error] ${loginError.errorMessage}",
                        );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
