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
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;

        double iconSize = availableWidth * 0.09;
        double fontSize = availableWidth * 0.04;
        double imageSize = availableWidth * 0.1;

        return BottomAppBar(
          height: 80,
          color: AppColors.gradientStart.withOpacity(.6),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: availableWidth * 0.002),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/ic_launcher.png',
                  width: imageSize,
                  height: imageSize,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: availableWidth * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Song - Vagianaa',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontFamily: Appfonts.arista,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Pussy',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontFamily: Appfonts.arista,
                            fontSize: fontSize,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  highlightColor: AppColors.accent.withOpacity(0.4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    size: iconSize,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  highlightColor: AppColors.accent.withOpacity(0.4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    size: iconSize,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  highlightColor: AppColors.accent.withOpacity(0.4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    size: iconSize,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
