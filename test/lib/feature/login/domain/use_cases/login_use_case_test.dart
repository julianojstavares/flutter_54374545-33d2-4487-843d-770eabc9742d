import 'package:flutter_study/feature/login/data/repositories/login_repository.dart';
import 'package:flutter_study/feature/login/domain/use_cases/login_use_case.dart';
import 'package:flutter_study/feature/login/external/fake_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../shared/test_data.dart';

void main() {
  group("Login Use Case", () {
    final loginDatasource = FakeAPI();
    final loginRepository = LoginRepository(loginDatasource: loginDatasource);
    final loginUseCase = LoginUseCase(loginRepository);

    test(
      "Login Use Case returns true when correct input is provided",
      () async {
        final result = await loginUseCase.execute(TestData.validInput);
        expect(result, true);
      },
    );

    test(
      "Login Use Case returns false when incorrect input is provided",
      () async {
        final result = await loginUseCase.execute(TestData.invalidInput);
        expect(result, false);
      },
    );
  });
}
