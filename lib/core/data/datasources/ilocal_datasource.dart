import '../../domain/entities/login_input_entity.dart';

abstract class ILocalDatasource {
  Future<void> saveCredentials(String key, LoginInputEntity credentials);
  Future<void> clearCredentials(String key);
  Future<LoginInputEntity?> retrieveCredentials(String key);
}
