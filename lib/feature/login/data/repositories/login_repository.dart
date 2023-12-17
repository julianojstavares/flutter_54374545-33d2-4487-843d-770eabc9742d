
import '../../domain/entities/login_input_entity.dart';
import '../../domain/repositories/ilogin_repository.dart';
import '../datasources/iexternal_datasource.dart';

class LoginRepository implements ILoginRepository {
  final IExternalDatasource externalDatasource;


  LoginRepository({
    required this.externalDatasource,
  });

  @override
  Future<bool> login(LoginInputEntity input) async {
    return await externalDatasource.login(input);
  }
}
