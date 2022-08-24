import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWrapper {
  static late SharedPreferences prefs;

  static void setToken(String token) async {
    await prefs.setString('token', token);
  }

  static String? getToken() {
    return prefs.getString('token');
  }

  static void removeToken() async {
    await prefs.remove('token');
  }
}
