import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/screens/login_screen.dart';

class MusicHomeScreen extends ConsumerStatefulWidget {
  const MusicHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MusicHomeScreenState();
}

class _MusicHomeScreenState extends ConsumerState<MusicHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.gradientStart, AppColors.gradientEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: DefaultTabController(
          length: 3, // Number of tabs
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        highlightColor: AppColors.accent.withOpacity(0.4),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          color: AppColors.accent,
                          size: 32,
                        ),
                      ),
                      IconButton(
                        highlightColor: AppColors.accent.withOpacity(0.4),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppColors.accent,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TabBar(
                    dividerColor: AppColors.textSecondary,
                    labelColor: AppColors.accent,
                    unselectedLabelColor: AppColors.textSecondary,
                    indicatorColor: AppColors.accent,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.music_note,
                          size: 28,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.library_music,
                          size: 28,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.cloud_queue_rounded,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                            child: Text(
                          'Local songs will Appear here',
                          style: TextStyle(
                              fontFamily: Appfonts.arista,
                              color: AppColors.textPrimary,
                              fontSize: 24),
                        )),
                        Center(
                            child: Text(
                          'Your Playlists will Appear here',
                          style: TextStyle(
                              fontFamily: Appfonts.arista,
                              color: AppColors.textPrimary,
                              fontSize: 24),
                        )),
                        Center(child: LoginScreen()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
