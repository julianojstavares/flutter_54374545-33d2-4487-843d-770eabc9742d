import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/home/home_module.dart';
import 'feature/login/login_module.dart';

class SharedPreferencesService {
 final Future<SharedPreferences> _instance;

 SharedPreferencesService() : _instance = SharedPreferences.getInstance();

 Future<SharedPreferences> get instance => _instance;
}

class AppModule extends Module {
    @override
  void exportedBinds(i) {
    i.addInstance<SharedPreferences>(prefs);
  }

  @override
  void routes(r) {
    r.module("/login/", module: LoginModule());
    r.module("/home/", module: HomeModule());
  }
}
