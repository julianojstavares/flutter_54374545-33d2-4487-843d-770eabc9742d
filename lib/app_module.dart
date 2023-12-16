import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/feature/home/home_module.dart';
import 'package:flutter_study/feature/login/login_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module("/login/", module: LoginModule());
    r.module("/home/", module: HomeModule());
  }
}
