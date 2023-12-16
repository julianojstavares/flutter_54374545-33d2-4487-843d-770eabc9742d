import 'package:flutter_study/feature/login/data/datasources/ilogin_datasource.dart';
import 'package:flutter_study/feature/login/domain/entities/login_input_entity.dart';
import 'package:flutter_study/shared/fake_data.dart';

class FakeAPI implements ILoginDatasource {
  @override
  Future<bool> login(LoginInputEntity input) async {
    await Future.delayed(const Duration(seconds: 3));


    if (input != FakeData.validInput) return false;
    return true;
  }
}
