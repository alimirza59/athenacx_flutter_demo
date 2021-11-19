import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {

  static final LocalPreferences _singleton = LocalPreferences._internal();

  factory LocalPreferences() => _singleton;

  LocalPreferences._internal(); // private constructor


  Future<void> setBoolToPref(String key, bool value) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }

  Future<bool> getBoolToPref(String key) async {
    SharedPreferences prefs = await getLocalPreferences();
    return prefs.getBool(key);
  }

  Future<SharedPreferences> getLocalPreferences() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return await _prefs;
  }
}
