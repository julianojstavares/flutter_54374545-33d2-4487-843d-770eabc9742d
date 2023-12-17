
import '../../domain/entities/login_input_entity.dart';
import '../../domain/repositories/icredentials_repository.dart';
import '../datasources/ilocal_datasource.dart';

class CredentialsRepository implements ICredentialsRepository {
    final ILocalDatasource localDatasource;

  CredentialsRepository({required this.localDatasource});

  @override
  Future<void> saveCredentials(LoginInputEntity credentials) async {
    await localDatasource.saveCredentials(credentials);
  }

  @override
  Future<LoginInputEntity?> retrieveCredentials() async {
    return await localDatasource.retrieveCredentials();
  }

  @override
  Future<void> clearCredentials() async {
    await localDatasource.clearCredentials();
  }

}