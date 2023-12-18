import 'package:flutter_study/core/domain/entities/login_input_entity.dart';

abstract class IExternalDatasource {
  Future<bool> login(LoginInputEntity input);
}
