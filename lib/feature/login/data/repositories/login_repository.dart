import 'package:flutter_study/feature/login/data/datasources/ilogin_datasource.dart';
import 'package:flutter_study/feature/login/domain/entities/login_input_entity.dart';
import 'package:flutter_study/feature/login/domain/repositories/ilogin_repository.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  LoginRepository({required this.loginDatasource});

  @override
  Future<bool> login(LoginInputEntity input) async {
    return await loginDatasource.login(input);
  }
}
