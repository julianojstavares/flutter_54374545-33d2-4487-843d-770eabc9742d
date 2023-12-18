import 'package:flutter_test/flutter_test.dart';

import '../../../../shared/test_data.dart';

void main() {
  group("LoginInputEntity", () {
    test('LoginInputEntity has the correct properties', () {
      expect(TestData.validInput.username, equals('Juliano'));
      expect(TestData.validInput.password, equals('contratado'));
    });

    test('LoginInputEntity has the incorrect properties', () {
      expect(TestData.invalidInput.username, equals('Juliano'));
      expect(() {
        if (TestData.invalidInput.password == 'reprovado') {
          throw Exception('Senha inválida');
        }
      }, throwsException);
    });
  });
}
