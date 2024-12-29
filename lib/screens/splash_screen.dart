// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/screens/music_home_screen.dart';
import 'package:melodies_music_app/screens/welcome_screen.dart';
import 'package:melodies_music_app/services/shared_preferences_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferencesServices services = SharedPreferencesServices();

  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check if the user has seen the welcome screen
    bool isWelcomed = await services.getOnBoardingStatus();

    // Navigate to the appropriate screen
    if (isWelcomed) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MusicHomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
        ),
        child: Center(
          child: Image.asset(
              'assets/images/ic_launcher.png'),
        ),
      ),
    );
  }
}
