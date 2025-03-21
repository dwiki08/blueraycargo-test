import 'package:shared_preferences/shared_preferences.dart';

enum PrefSetting {
  authToken("token");

  final String key;

  const PrefSetting(this.key);
}

class LocalDataSource {
  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PrefSetting.authToken.key, token);
  }

  Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(PrefSetting.authToken.key);
    return token;
  }

  Future<void> clearAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(PrefSetting.authToken.key);
  }
}
