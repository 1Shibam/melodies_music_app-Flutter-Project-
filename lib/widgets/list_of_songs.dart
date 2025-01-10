// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/config/app_theme.dart';
import 'package:melodies_music_app/providers/audio_player_provider.dart';
import 'package:melodies_music_app/providers/player_controller_provider.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

class ListOfSongs extends ConsumerWidget {
  const ListOfSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the list of songs with permission check
    final songList = ref.watch(permissionNotifierProvider.notifier).fetchSongsWithPermissionCheck();

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
              double availableWidth = constraints.maxWidth;

              double titleFontSize = availableWidth * 0.045;
              double subtitleFontSize = availableWidth * 0.035;

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final song = snapshot.data![index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Play the selected song
                        playSong(ref, snapshot.data![index].uri.toString(), index);
                      },
                      child: ListTile(
                        leading: QueryArtworkWidget(
                          id: snapshot.data![index].id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: const SizedBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.music_note,
                              color: AppColors.primary,
                              size: 28,
                            ),
                          ),
                        ),
                        trailing: Consumer(
                          builder: (context, watch, child) {
                            final playbackState = watch;

                            return IconButton(
                              onPressed: () {
                                if (playbackState == PlaybackState.playing) {
                                  // Pause if the song is currently playing
                                  togglePlayPause(ref);
                                } else {
                                  // Play if the song is paused
                                  playSong(ref, snapshot.data![index].uri.toString(), index);
                                }
                              },
                              icon: Icon(
                                playbackState == PlaybackState.playing
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: AppColors.primary,
                                size: 28,
                              ),
                            );
                          },
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        tileColor: AppColors.accent.withOpacity(0.04),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
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
