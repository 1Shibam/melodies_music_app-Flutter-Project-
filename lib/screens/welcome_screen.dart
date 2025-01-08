import 'package:flutter/material.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/widgets/welcome_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController viewController = PageController();
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the available width and height
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        // Adjust padding based on available height
        double bottomPadding = availableHeight * 0.1;

        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: availableHeight,
                width: availableWidth,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gradientStart,
                      AppColors.gradientEnd,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView(
                      controller: viewController,
                      children: const [
                        WelcomePageWidget(
                          title: "Welcome to Melodies",
                          imgPath: 'assets/images/music-notes-svgrepo-com.png',
                          description: "Your ultimate music experience awaits!",
                          image: Icons.music_note,
                        ),
                        WelcomePageWidget(
                          title: "Explore Your Music",
                          imgPath: 'assets/images/music-folder-svgrepo-com.png',
                          description: "Access all your favorite tunes from your device.",
                          image: Icons.library_music,
                        ),
                        WelcomePageWidget(
                          title: "Control with Ease",
                          imgPath: 'assets/images/music-play-svgrepo-com.png',
                          description: "Play, pause, and manage music with a single tap.",
                          image: Icons.play_circle_fill,
                        ),
                        WelcomePageWidget(
                          title: "Stay in the Groove",
                          imgPath: 'assets/images/video-player-music-play-multimedia-svgrepo-com.png',
                          description: "Enjoy seamless background playback.",
                          image: Icons.notifications_active,
                          showButton: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: SmoothPageIndicator(
                      controller: viewController,
                      count: 4,
                      onDotClicked: (index) => viewController.jumpToPage(index),
                      effect: const WormEffect(
                        activeDotColor: AppColors.accent,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 2,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 16,
                        dotColor: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
