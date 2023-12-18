
import '../../domain/entities/login_input_entity.dart';
import '../../domain/repositories/icredentials_repository.dart';
import '../datasources/ilocal_datasource.dart';

class CredentialsRepository implements ICredentialsRepository {
    final ILocalDatasource localDatasource;

  CredentialsRepository({required this.localDatasource});

  @override
  Future<void> saveCredentials(String key, LoginInputEntity credentials) async {
    await localDatasource.saveCredentials(key, credentials);
  }

  @override
  Future<LoginInputEntity?> retrieveCredentials(String key) async {
    return await localDatasource.retrieveCredentials(key);
  }

  @override
  Future<void> clearCredentials(String key) async {
    await localDatasource.clearCredentials(key);
  }

}