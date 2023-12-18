import 'package:flutter_study/core/data/datasources/local/shared_preferences_datasource.dart';
import 'package:flutter_study/core/data/repositories/credentials_repository.dart';
import 'package:flutter_study/feature/home/domain/use_cases/clear_credentials_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSharedPreferences extends Mock
    implements SharedPreferencesDatasource {}

void main() {
  late MockSharedPreferences sharedPreferences;
  late CredentialsRepository credentialsRepository;
  late ClearCredentialsUseCase clearCredentialsUseCase;

  setUpAll(() {
    sharedPreferences = MockSharedPreferences();
    credentialsRepository = CredentialsRepository(
      localDatasource: sharedPreferences,
    );
    clearCredentialsUseCase = ClearCredentialsUseCase(
      credentialsRepository: credentialsRepository,
    );
  });

  test("Should call clear login credentials", () async {
    when(() => sharedPreferences.clearCredentials("test"))
        .thenAnswer((_) async => {});

    await clearCredentialsUseCase.call(key: "test");

    verify(
      () => sharedPreferences.clearCredentials("test"),
    ).called(1);
  });
}
