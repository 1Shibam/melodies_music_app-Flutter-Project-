// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/screens/music_home_screen.dart';
import 'package:melodies_music_app/services/shared_preferences_services.dart';

class WelcomePageWidget extends ConsumerWidget {
  final String title;
  final String imgPath;
  final String description;
  final IconData image;
  final bool showButton;

  const WelcomePageWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.imgPath,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SharedPreferencesServices sharedPreferencesServices =
        SharedPreferencesServices();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                fontFamily: Appfonts.aristaBold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
                fontSize: 24,
                color: AppColors.textSecondary,
                fontFamily: Appfonts.arista),
            textAlign: TextAlign.center,
          ),
          if (showButton) const SizedBox(height: 40),
          if (showButton)
            GestureDetector(
              onTap: () async {
                await sharedPreferencesServices.setOnBoardingStatus(true);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MusicHomeScreen(),
                    ));
              },
              child: Container(
                height: 60,
                width: 240,
                decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: Appfonts.aristaBold),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
