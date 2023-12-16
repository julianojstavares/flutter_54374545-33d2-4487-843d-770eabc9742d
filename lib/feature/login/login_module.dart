import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/feature/login/presentation/page/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      "/",
      child: (_) => const LoginPage(),
    );
  }
}
