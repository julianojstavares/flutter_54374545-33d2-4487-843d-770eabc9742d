import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/login_input_entity.dart';
import '../ilocal_datasource.dart';

class SharedPreferencesDatasource implements ILocalDatasource {
  final SharedPreferences _prefs;

  SharedPreferencesDatasource({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  @override
  Future<void> clearCredentials(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<LoginInputEntity?> retrieveCredentials(String key) async {
    final credentials = _prefs.getStringList(key);
    if (credentials != null && credentials.length == 2) {
      return LoginInputEntity(
        username: credentials[0],
        password: credentials[1],
      );
    }
    return null;
  }

  @override
  Future<void> saveCredentials(String key, LoginInputEntity credentials) async {
    await _prefs
        .setStringList(key, [credentials.username, credentials.password]);
  }
}
