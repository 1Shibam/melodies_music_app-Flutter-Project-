import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';


class MusicHomeScreen extends ConsumerStatefulWidget {
  const MusicHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MusicHomeScreenState();
}

class _MusicHomeScreenState extends ConsumerState<MusicHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.gradientStart, AppColors.gradientEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
        child: Padding(
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
                        size: 28,
                      )),
                  IconButton(
                      highlightColor: AppColors.accent.withOpacity(0.4),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: AppColors.accent,
                        size: 28,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
