import 'package:shared_preferences/shared_preferences.dart';

/// Helper class for managing SharedPreferences in a more modular and concise way.
class SharedPreferencesHelper {
  // The sharedPreferences instance
  static SharedPreferences? _sharedPreferences;

  // This method initializes the SharedPreferences instance
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Setters and Getters for shared preferences
  static Future<bool> saveString(String key, String value) async {
    return await _sharedPreferences?.setString(key, value) ?? false;
  }

  static String? getString(String key) {
    return _sharedPreferences?.getString(key);
  }

  static Future<bool> saveBool(String key, bool value) async {
    return await _sharedPreferences?.setBool(key, value) ?? false;
  }

  static bool? getBool(String key) {
    return _sharedPreferences?.getBool(key);
  }

  static Future<bool> saveInt(String key, int value) async {
    return await _sharedPreferences?.setInt(key, value) ?? false;
  }

  static int? getInt(String key) {
    return _sharedPreferences?.getInt(key);
  }

  static Future<bool> saveDouble(String key, double value) async {
    return await _sharedPreferences?.setDouble(key, value) ?? false;
  }

  static double? getDouble(String key) {
    return _sharedPreferences?.getDouble(key);
  }

  // Clear a single key-value pair
  static Future<bool> remove(String key) async {
    return await _sharedPreferences?.remove(key) ?? false;
  }

  // Clear all data
  static Future<bool> clear() async {
    return await _sharedPreferences?.clear() ?? false;
  }
}

/// Shared Preference Keys
class SharedPrefKeys {
  static String userName =  "user_name";
  static String gender =  "gender";
  
  static String userId =  "user_id";

  static String token =  "user_token";
  static String refreshToken =
       "refreshToken";
  static String onBoarding =
       "welcome_screen";
  //* theme
  static String isDarkMode =  "theme";
}