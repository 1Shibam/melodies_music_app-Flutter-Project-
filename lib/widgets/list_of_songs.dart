import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/providers/player_controller_provider.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

class ListOfSongs extends ConsumerWidget {
  const ListOfSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songList = ref
        .watch(permissionNotifierProvider.notifier)
        .fetchSongsWithPermissionCheck();

    return FutureBuilder<List<SongModel>>(
      future: songList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Image.asset('assets/images/music loader.gif'),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontFamily: Appfonts.arista,
                fontSize: 20,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // Determine the available width
              double availableWidth = constraints.maxWidth;

              // Calculate text size based on available width
              double titleFontSize = availableWidth * 0.05; // Adjust as needed
              double subtitleFontSize =
                  availableWidth * 0.04; // Adjust as needed

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final song = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: AppColors.accent.withOpacity(0.04),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      title: Text(
                        song.title,
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontFamily: Appfonts.arista,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      subtitle: Text(
                        song.artist ?? 'Unknown Artist',
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontFamily: Appfonts.arista,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              'No songs found.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontFamily: Appfonts.arista,
                fontSize: 20,
              ),
            ),
          );
        }
      },
    );
  }
}
