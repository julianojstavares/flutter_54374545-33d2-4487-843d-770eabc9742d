import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/feature/home/presentation/widgets/no_save_widget.dart';
import 'package:flutter_study/feature/home/presentation/widgets/yes_save_widget.dart';
import 'package:flutter_study/core/domain/entities/login_input_entity.dart';

import '../../domain/use_cases/retrieve_credentials_use_case.dart';
import 'home_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = homeTheme();
    final retrieveCredentialsUseCase =
        Modular.get<RetrieveCredentialsUseCase>();
    return Theme(
      data: theme,
      child: Scaffold(
        body: FutureBuilder<LoginInputEntity?>(
          future: retrieveCredentialsUseCase.call(key: "login_credentials"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("bla"),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }

            final savedCredentials = snapshot.data;
            return Visibility(
              visible: savedCredentials == null,
              replacement: const YesSaveWidget(),
              child: const NoSaveWidget(),
            );
          },
        ),
      ),
    );
  }
}
