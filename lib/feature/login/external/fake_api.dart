import 'package:flutter_study/feature/login/data/datasources/ilogin_datasource.dart';
import 'package:flutter_study/feature/login/domain/entities/login_input_entity.dart';

class FakeAPI implements ILoginDatasource {
  @override
  Future<bool> login(LoginInputEntity input) async {
    await Future.delayed(const Duration(seconds: 3));

    const validInput = LoginInputEntity(
      username: "Juliano",
      password: "contratado",
    );

    if (input != validInput) return false;
    return true;
  }
}
