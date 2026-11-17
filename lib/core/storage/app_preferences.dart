import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Onboarding
  static bool get onboardingCompleted =>
      _prefs.getBool('onboarding_completed') ?? false;

  static Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool('onboarding_completed', value);
  }

  static String get userName => _prefs.getString('user_name') ?? '';

  static Future<void> setUserName(String value) async {
    await _prefs.setString('user_name', value);
  }

  // Theme
  static bool get isDarkMode => _prefs.getBool('is_dark_mode') ?? false;

  static Future<void> setDarkMode(bool value) async {
    await _prefs.setBool('is_dark_mode', value);
  }
}
