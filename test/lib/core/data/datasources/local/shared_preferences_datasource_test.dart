import 'package:flutter_study/core/data/datasources/local/shared_preferences_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../shared/test_data.dart';

/*
Os testes unitários do Flutter são executados em um ambiente diferente
do ambiente de execução do aplicativo, o que significa que eles não têm
acesso às implementações nativas dos plugins. Portanto, o SharedPreferences
não pode ser usado diretamente nos testes unitários.

Uma solução para isso é usar 

SharedPreferences.setMockInitialValues({})

para simular o SharedPreferences. 

Isso permite o código seja testado sem depender da execução do app.
 */

void main() {
  group('SharedPreferencesDatasource', () {
    late SharedPreferencesDatasource datasource;
    late SharedPreferences prefs;

    setUpAll(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      datasource = SharedPreferencesDatasource(prefs: prefs);
    });

    test('should save credentials', () async {
      const credentials = TestData.validInput;
      await datasource.saveCredentials('test', credentials);
      final savedCredentials = await datasource.retrieveCredentials('test');
      expect(savedCredentials, credentials);
    });

    test('should retrieve credentials', () async {
      const credentials = TestData.validInput;
      await datasource.saveCredentials('test', credentials);
      final savedCredentials = await datasource.retrieveCredentials('test');
      expect(savedCredentials, credentials);
    });

    test('should clear credentials', () async {
      const credentials = TestData.validInput;
      await datasource.saveCredentials('test', credentials);
      await datasource.clearCredentials('test');
      final clearedCredentials = await datasource.retrieveCredentials('test');
      expect(clearedCredentials, null);
    });

    tearDownAll(() async {
      await prefs.clear();
    });
  });
}
