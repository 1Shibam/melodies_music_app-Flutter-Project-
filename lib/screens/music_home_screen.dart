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
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.gradientStart, AppColors.gradientEnd],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: DefaultTabController(
            length: 3, // Number of tabs
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(''),
                  
                  SizedBox(
                    height: 8,
                  ),
                  TabBar(
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
                  Expanded(
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
