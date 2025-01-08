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

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the available width and height
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        // Adjust image size based on available width
        double imageSize = availableWidth * 0.5;

        // Adjust font sizes based on available width
        double titleFontSize = availableWidth * 0.1;
        double descriptionFontSize = availableWidth * 0.07;

        // Adjust button size based on available width
        double buttonWidth = availableWidth * 0.6;
        double buttonHeight = availableHeight * 0.08;

        return Container(
          padding: EdgeInsets.all(availableWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgPath,
                height: imageSize,
                width: imageSize,
              ),
              SizedBox(height: availableHeight * 0.05),
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  fontFamily: Appfonts.arista,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: availableHeight * 0.02),
              Text(
                description,
                style: TextStyle(
                  fontSize: descriptionFontSize,
                  color: AppColors.textSecondary,
                  fontFamily: Appfonts.arista,
                ),
                textAlign: TextAlign.center,
              ),
              if (showButton) SizedBox(height: availableHeight * 0.05),
              if (showButton)
                GestureDetector(
                  onTap: () async {
                    await sharedPreferencesServices.setOnBoardingStatus(true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MusicHomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: buttonHeight,
                    width: buttonWidth,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(buttonHeight / 2),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: descriptionFontSize,
                          fontWeight: FontWeight.bold,
                          fontFamily: Appfonts.aristaBold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
