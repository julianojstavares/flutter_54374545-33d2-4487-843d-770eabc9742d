import 'package:flutter_study/feature/login/external/fake_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../shared/test_data.dart';

void main() {
  group("Fake API", () {
    final fakeAPI = FakeAPI();

    test('FakeAPI returns true when correct input is provided', () async {
      final result = await fakeAPI.login(TestData.validInput);

      await Future.delayed(const Duration(seconds: 3));

      expect(result, isTrue);
    });

    test('FakeAPI returns false when incorrect input is provided', () async {
      final result = await fakeAPI.login(TestData.invalidInput);

      await Future.delayed(const Duration(seconds: 3));

      expect(result, isFalse);
    });
  });
}
