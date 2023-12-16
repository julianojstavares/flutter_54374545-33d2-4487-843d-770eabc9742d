import 'package:flutter_study/feature/login/domain/entities/login_input_entity.dart';

abstract class ILoginRepository {
  Future<bool> login(LoginInputEntity input);
}