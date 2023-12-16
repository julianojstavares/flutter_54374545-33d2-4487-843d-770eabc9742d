import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/feature/home/presentation/page/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/", child: (_) => const HomePage());
  }
}
