import '../../domain/entities/login_input_entity.dart';

abstract class ILocalDatasource {
  Future<void> saveCredentials(LoginInputEntity credentials);
  Future<void> clearCredentials();
  Future<LoginInputEntity?> retrieveCredentials();
}
