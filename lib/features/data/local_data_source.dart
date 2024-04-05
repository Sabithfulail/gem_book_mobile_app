import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String USERNAME = 'username';

class LocalDataSource {
  SharedPreferences? prefs;
  FlutterSecureStorage? secureStorage;

  LocalDataSource(
      {FlutterSecureStorage? securePreferences,
      SharedPreferences? sharedPreferences}) {
    secureStorage = securePreferences;
    prefs = sharedPreferences;
  }

  void setUsername(String username) {
    secureStorage!.write(key: USERNAME, value: username);
  }

  Future<String> getUserName() async {
    final username = await secureStorage!.read(key: USERNAME);
    return username!;
  }
}
