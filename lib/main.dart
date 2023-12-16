import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study/app_module.dart';
import 'package:flutter_study/app_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? username = prefs.getString('username');
  String? password = prefs.getString('password');

  String initialRoute = "";

  if (username != null && password != null) {
    initialRoute = '/home/';
    Modular.setInitialRoute(initialRoute);
  } else {
    Modular.setInitialRoute('/login/');
  }

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
