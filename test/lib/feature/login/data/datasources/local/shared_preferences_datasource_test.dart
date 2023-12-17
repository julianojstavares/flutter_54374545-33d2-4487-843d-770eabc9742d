import 'package:flutter_study/feature/login/data/datasources/local/shared_preferences_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../shared/test_data.dart';

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
