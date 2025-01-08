import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/screens/login_screen.dart';
import 'package:melodies_music_app/widgets/list_of_songs.dart';
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isSmallScreen = constraints.maxWidth < 600;

          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gradientStart, AppColors.gradientEnd],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: isSmallScreen ? 16.0 : 24.0),
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
                              height: isSmallScreen ? 44 : 56,
                              width: isSmallScreen ? 44 : 56,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  highlightColor:
                                      AppColors.accent.withOpacity(0.4),
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.multitrack_audio,
                                    color: AppColors.primary,
                                    size: isSmallScreen ? 32 : 40,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  highlightColor:
                                      AppColors.accent.withOpacity(0.4),
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.settings,
                                    color: AppColors.primary,
                                    size: isSmallScreen ? 32 : 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const TabBar(
                        dividerColor: AppColors.textSecondary,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.textSecondary,
                        indicatorColor: AppColors.accent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(icon: Icon(Icons.music_note, size: 32)),
                          Tab(icon: Icon(Icons.library_music, size: 32)),
                          Tab(icon: Icon(Icons.cloud_queue_rounded, size: 32)),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 20),
                                  child: SearchBar(
                                    hintText: 'Search song',
                                    hintStyle: const WidgetStatePropertyAll(
                                      TextStyle(
                                        color: AppColors.textSecondary,
                                        fontFamily: Appfonts.arista,
                                        fontSize: 20,
                                      ),
                                    ),
                                    trailing: [
                                      IconButton(
                                        highlightColor:
                                            AppColors.accent.withOpacity(0.4),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.filter_alt_outlined,
                                          color: AppColors.primary,
                                          size: 32,
                                        ),
                                      ),
                                      IconButton(
                                        highlightColor:
                                            AppColors.accent.withOpacity(0.4),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.search_outlined,
                                          color: AppColors.primary,
                                          size: 32,
                                        ),
                                      ),
                                    ],
                                    side: const WidgetStatePropertyAll(
                                      BorderSide(color: AppColors.accent),
                                    ),
                                    shadowColor: const WidgetStatePropertyAll(
                                        Colors.transparent),
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            Colors.transparent),
                                  ),
                                ),
                                const Expanded(child: ListOfSongs()),
                              ],
                            ),
                            const Center(
                              child: Text(
                                'Your Playlists will Appear here',
                                style: TextStyle(
                                  fontFamily: Appfonts.arista,
                                  color: AppColors.textPrimary,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const Center(child: LoginScreen()),
                          ],
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: SongBottomPlayer(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
