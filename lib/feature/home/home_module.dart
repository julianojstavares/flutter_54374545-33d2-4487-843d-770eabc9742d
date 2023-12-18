import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import 'domain/use_cases/clear_credentials_use_case.dart';
import 'domain/use_cases/retrieve_credentials_use_case.dart';
import 'presentation/page/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    i.add(RetrieveCredentialsUseCase.new);
    i.add(ClearCredentialsUseCase.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const HomePage());
  }
}
