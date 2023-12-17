import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/feature/login/data/datasources/ilogin_datasource.dart';
import 'package:flutter_study/feature/login/data/repositories/login_repository.dart';
import 'package:flutter_study/feature/login/domain/repositories/ilogin_repository.dart';
import 'package:flutter_study/feature/login/domain/use_cases/login_use_case.dart';
import 'package:flutter_study/feature/login/external/fake_api.dart';
import 'package:flutter_study/feature/login/presentation/controllers/login_submit_controller.dart';
import 'package:flutter_study/feature/login/presentation/page/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.add<ILoginDatasource>(FakeAPI.new);
    i.add<ILoginRepository>(LoginRepository.new);
    i.add(LoginUseCase.new);
    i.addSingleton(LoginSubmitController.new);
  }

  @override
  void routes(r) {
    r.child(
      "/",
      child: (_) => LoginPage(controller: Modular.get()),
    );
  }
}
