import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/datasources/ilocal_datasource.dart';
import 'core/data/datasources/local/shared_preferences_datasource.dart';
import 'core/data/repositories/credentials_repository.dart';
import 'core/domain/repositories/icredentials_repository.dart';
import 'feature/home/home_module.dart';
import 'core/presentation/controller/credentials_controller.dart';
import 'feature/login/login_module.dart';
import 'main.dart';

class AppModule extends Module {
  @override
  void exportedBinds(i) {
    i.addInstance<SharedPreferences>(prefs);
    i.addSingleton(CredentialsControler.new);
    i.add<ILocalDatasource>(SharedPreferencesDatasource.new);
    i.add<ICredentialsRepository>(CredentialsRepository.new);
  }

  @override
  void routes(r) {
    r.module("/login/", module: LoginModule());
    r.module("/home/", module: HomeModule());
  }
}
