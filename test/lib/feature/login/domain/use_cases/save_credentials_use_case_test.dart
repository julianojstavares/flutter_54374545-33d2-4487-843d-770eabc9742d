import 'package:flutter_study/feature/login/data/datasources/local/shared_preferences_datasource.dart';
import 'package:flutter_study/feature/login/data/repositories/credentials_repository.dart';
import 'package:flutter_study/feature/login/domain/use_cases/save_credentials_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../shared/test_data.dart';

class MockSharedPreferences extends Mock
    implements SharedPreferencesDatasource {}

void main() {
  late MockSharedPreferences sharedPreferences;
  late CredentialsRepository credentialsRepository;
  late SaveCredentialsUseCase saveCredentialsUseCase;

  setUpAll(() {
    sharedPreferences = MockSharedPreferences();
    credentialsRepository = CredentialsRepository(
      localDatasource: sharedPreferences,
    );
    saveCredentialsUseCase = SaveCredentialsUseCase(
      credentialsRepository: credentialsRepository,
    );
  });

  test("Should call save login credentials", () async {
    const credentials = TestData.validInput;

    when(() => sharedPreferences.saveCredentials(credentials))
        .thenAnswer((_) async => {});

    await saveCredentialsUseCase.call(credentials);

    verify(
      () => sharedPreferences.saveCredentials(credentials),
    ).called(1);
  });
}
