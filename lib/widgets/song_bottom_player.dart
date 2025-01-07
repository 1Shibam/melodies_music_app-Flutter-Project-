import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';

class SongBottomPlayer extends ConsumerStatefulWidget {
  const SongBottomPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SongBottomPlayerState();
}

class _SongBottomPlayerState extends ConsumerState<SongBottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 80,
      color: AppColors.gradientStart.withOpacity(.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/ic_launcher.png'),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Song - Vagianaa',
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: Appfonts.arista,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                'Pussy',
                style: TextStyle(
                    color: AppColors.textSecondary,
                    fontFamily: Appfonts.arista,
                    fontSize: 16),
              )
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_previous,
                size: 28,
                color: AppColors.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
                size: 28,
                color: AppColors.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_next,
                size: 28,
                color: AppColors.primary,
              )),
        ],
      ),
    );
  }
}
