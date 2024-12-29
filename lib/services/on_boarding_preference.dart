import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPreference {
  static const String userWelcomeKey = 'welcomed';
  Future<void> getOnBoardingPreference() async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }
}
