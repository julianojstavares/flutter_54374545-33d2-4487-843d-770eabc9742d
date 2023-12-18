import 'package:flutter_study/core/domain/entities/login_input_entity.dart';

class TestData {
  static const validInput = LoginInputEntity(
    username: 'Juliano',
    password: 'contratado',
  );

  static const invalidInput = LoginInputEntity(
    username: 'Juliano',
    password: 'reprovado',
  );
}