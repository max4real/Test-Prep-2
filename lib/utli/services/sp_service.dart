import 'package:shared_preferences/shared_preferences.dart';

class SpService {
  static final SpService _instance = SpService._internal();

  factory SpService() => _instance;

  SpService._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Save data
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  // Read data
  String? getString(String key) => _prefs?.getString(key);

  int? getInt(String key) => _prefs?.getInt(key);

  bool? getBool(String key) => _prefs?.getBool(key);

  double? getDouble(String key) => _prefs?.getDouble(key);

  List<String>? getStringList(String key) => _prefs?.getStringList(key);

  // Remove key
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Clear all
  Future<void> clear() async {
    await _prefs?.clear();
  }
}

class SpKey {
  static const token = "token";
  static const email = "email";
}
