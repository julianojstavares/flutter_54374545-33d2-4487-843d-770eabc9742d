import 'package:flutter_modular/flutter_modular.dart';

import 'feature/home/home_module.dart';
import 'feature/login/login_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module("/login/", module: LoginModule());
    r.module("/home/", module: HomeModule());
  }
}
