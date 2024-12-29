import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static const String welcomeKey = 'OnBoardingCompleted';
  Future<bool> getOnBoardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(welcomeKey) ?? false;
  }

  Future<void> setOnBoardingStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(welcomeKey, status);
  }
}
