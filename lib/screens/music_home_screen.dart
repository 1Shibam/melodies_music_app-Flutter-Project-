import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/screens/login_screen.dart';
import 'package:melodies_music_app/widgets/song_bottom_player.dart';

class MusicHomeScreen extends ConsumerStatefulWidget {
  const MusicHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MusicHomeScreenState();
}

class _MusicHomeScreenState extends ConsumerState<MusicHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/ic_launcher.png',
                          height: 48,
                          width: 48,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                highlightColor:
                                    AppColors.accent.withOpacity(0.4),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.multitrack_audio,
                                  color: AppColors.primary,
                                  size: 36,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                highlightColor:
                                    AppColors.accent.withOpacity(0.4),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.settings,
                                  color: AppColors.primary,
                                  size: 36,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TabBar(
                    dividerColor: AppColors.textSecondary,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.textSecondary,
                    indicatorColor: AppColors.accent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.music_note,
                          size: 32,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.library_music,
                          size: 32,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.cloud_queue_rounded,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                            child: Text(
                          'Songs list will be here',
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
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: SongBottomPlayer()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
