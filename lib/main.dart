import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/app_module.dart';
import 'package:flutter_study/app_widget.dart';
import 'package:flutter_study/core/data/datasources/local/shared_preferences_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  final localDatasource = SharedPreferencesDatasource(prefs: prefs);

  final credentials =
      await localDatasource.retrieveCredentials("login_credentials");

  String initialRoute = "";

  if (credentials != null) {
    initialRoute = '/home/';
  } else {
    initialRoute = '/login/';
  }
  Modular.setInitialRoute(initialRoute);
  Modular.setNavigatorKey(navigatorKey);

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
