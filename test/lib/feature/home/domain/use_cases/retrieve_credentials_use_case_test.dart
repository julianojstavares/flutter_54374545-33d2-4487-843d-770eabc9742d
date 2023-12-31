import 'package:flutter_study/core/data/datasources/local/shared_preferences_datasource.dart';
import 'package:flutter_study/core/data/repositories/credentials_repository.dart';
import 'package:flutter_study/feature/home/domain/use_cases/retrieve_credentials_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../shared/test_data.dart';

class MockSharedPreferences extends Mock
    implements SharedPreferencesDatasource {}

void main() {
  late MockSharedPreferences sharedPreferences;
  late CredentialsRepository credentialsRepository;
  late RetrieveCredentialsUseCase retrieveCredentialsUseCase;

  setUpAll(() {
    sharedPreferences = MockSharedPreferences();
    credentialsRepository = CredentialsRepository(
      localDatasource: sharedPreferences,
    );
    retrieveCredentialsUseCase = RetrieveCredentialsUseCase(
      credentialsRepository: credentialsRepository,
    );
  });

  group("Retrieve Credentials", () {
    test('should return credentials when they are available', () async {
      const expectedCredentials = TestData.validInput;
      when(() => sharedPreferences.retrieveCredentials("test"))
          .thenAnswer((_) async => expectedCredentials);

      final result = await retrieveCredentialsUseCase.call(key: "test");

      expect(result, equals(expectedCredentials));
    });

    test('should return null when no credentials are available', () async {
      when(() => sharedPreferences.retrieveCredentials("test"))
          .thenAnswer((_) async => null);

      final result = await retrieveCredentialsUseCase.call(key: "test");

      expect(result, isNull);
    });
  });
}
