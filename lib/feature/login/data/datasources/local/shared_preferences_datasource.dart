import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/login_input_entity.dart';
import '../ilocal_datasource.dart';

class SharedPreferencesDatasource implements ILocalDatasource {
  static const String _key = 'login_credentials';

  @override
  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  @override
  Future<LoginInputEntity?> retrieveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final credentials = prefs.getStringList(_key);
    if (credentials != null && credentials.length == 2) {
      return LoginInputEntity(
        username: credentials[0],
        password: credentials[1],
      );
    }
    return null;
  }

  @override
  Future<void> saveCredentials(LoginInputEntity credentials) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, [credentials.username, credentials.password]);
  }
}