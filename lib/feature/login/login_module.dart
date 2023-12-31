import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import 'data/datasources/external/fake_api.dart';
import 'data/datasources/iexternal_datasource.dart';
import 'data/repositories/login_repository.dart';
import 'domain/repositories/ilogin_repository.dart';
import 'domain/use_cases/login_use_case.dart';
import 'domain/use_cases/save_credentials_use_case.dart';
import 'presentation/controllers/login_submit_controller.dart';
import 'presentation/page/login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) async {
    i.add(SaveCredentialsUseCase.new);
    i.add<IExternalDatasource>(FakeAPI.new);
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
