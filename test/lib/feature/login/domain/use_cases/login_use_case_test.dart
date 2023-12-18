import 'package:flutter_study/feature/login/data/repositories/login_repository.dart';
import 'package:flutter_study/feature/login/domain/use_cases/login_use_case.dart';
import 'package:flutter_study/feature/login/data/datasources/external/fake_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../shared/test_data.dart';

class MockFakeAPI extends Mock implements FakeAPI {}

void main() {
  late MockFakeAPI fakeAPI;
  late LoginRepository loginRepository;
  late LoginUseCase loginUseCase;

  setUpAll(() {
    fakeAPI = MockFakeAPI();
    loginRepository = LoginRepository(externalDatasource: fakeAPI);
    loginUseCase = LoginUseCase(repository: loginRepository);
  });

  group("Login Use Case", () {
    test(
      "returns true when correct input is provided",
      () async {
        when(
          () => fakeAPI.login(TestData.validInput),
        ).thenAnswer((_) async => true);
        final result = await loginUseCase.execute(TestData.validInput);
        expect(result, true);
      },
    );

    test(
      "returns false when incorrect input is provided",
      () async {
        when(
          () => fakeAPI.login(TestData.invalidInput),
        ).thenAnswer((_) async => false);
        final result = await loginUseCase.execute(TestData.invalidInput);
        expect(result, false);
      },
    );
  });
}
