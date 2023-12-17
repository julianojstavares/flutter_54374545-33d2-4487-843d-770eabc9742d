import '../entities/login_input_entity.dart';

abstract class ICredentialsRepository {
  Future<void> saveCredentials(LoginInputEntity credentials);
  Future<void> clearCredentials();
  Future<LoginInputEntity?> retrieveCredentials();
}
