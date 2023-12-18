import 'package:flutter/material.dart';
import 'package:flutter_study/core/data/datasources/local/shared_preferences_datasource.dart';
import 'package:flutter_study/core/data/repositories/credentials_repository.dart';
import 'package:flutter_study/feature/login/data/datasources/external/fake_api.dart';
import 'package:flutter_study/feature/login/data/repositories/login_repository.dart';
import 'package:flutter_study/feature/login/domain/use_cases/login_use_case.dart';
import 'package:flutter_study/feature/login/domain/use_cases/save_credentials_use_case.dart';
import 'package:flutter_study/feature/login/presentation/controllers/login_submit_controller.dart';
import 'package:flutter_study/feature/login/presentation/page/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final localDatasource = SharedPreferencesDatasource(prefs: prefs);
  final externalDatasource = FakeAPI();
  final loginRepository =
      LoginRepository(externalDatasource: externalDatasource);
  final credentialsRepository =
      CredentialsRepository(localDatasource: localDatasource);
  final loginUseCase = LoginUseCase(repository: loginRepository);
  final saveCredentialsUseCase =
      SaveCredentialsUseCase(credentialsRepository: credentialsRepository);
  final loginSubmitController = LoginSubmitController(
    loginUseCase: loginUseCase,
    saveCredentialsUseCase: saveCredentialsUseCase,
  );

  group("Login Page Tests", () {
    loadLoginPage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(controller: loginSubmitController),
        ),
      );
    }

    testWidgets('Test LoginFormWidget submit button', (
      WidgetTester tester,
    ) async {
      await loadLoginPage(tester);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull,
      );
      await tester.enterText(find.byType(TextFormField).at(0), 'testUser');
      await tester.enterText(find.byType(TextFormField).at(1), 'testPassword');
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
        isNotNull,
      );
    });
  });
}
