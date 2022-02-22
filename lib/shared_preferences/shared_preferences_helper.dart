import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;

  static SharedPreferencesHelper get instance => _instance ??= SharedPreferencesHelper._();

  SharedPreferences? _sharedPreferences;

  SharedPreferencesHelper._() {
    SharedPreferences.getInstance().then((SharedPreferences value) {
      _sharedPreferences = value;
    });
  }

  Future<void> setStringValue(String key, String value) async {
    await _sharedPreferences?.setString(key, value);
  }

  String? getStringValue(String key) {
    return _sharedPreferences?.getString(key);
  }
}
