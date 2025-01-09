import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

final audioQueryProvider = Provider<OnAudioQuery>((ref) {
  return OnAudioQuery();
});


final permissionNotifierProvider =
    AsyncNotifierProvider<PermissionNotifier, bool>(() {
  return PermissionNotifier();
});

class PermissionNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    return await checkPermission();
  }

  

  Future<bool> checkPermission() async {
    final audioQuery = ref.read(audioQueryProvider);
    final permissionStatus = await audioQuery.permissionsStatus();
    if (!permissionStatus) {
      return await audioQuery.permissionsRequest();
    }
    return permissionStatus;
  }

  Future<List<SongModel>> fetchSongsWithPermissionCheck() async {
    final audioQuery = ref.read(audioQueryProvider);

    // Request storage permission using permission_handler package
    final permission = await Permission.storage.request();
    if (permission.isGranted) {
      // Query songs only if permission is granted
      List<SongModel> songs = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,
      );

      // Filter out non-music files based on file extensions (mp3, wav, etc.)
      return songs.where((song) {
        // Check for common music file extensions
        return song.fileExtension == 'mp3' ||
            song.fileExtension == 'wav' ||
            song.fileExtension == 'aac' ||
            song.fileExtension == 'flac' ||
            song.fileExtension == 'ogg' ||
            song.fileExtension == 'm4a' ||
            song.fileExtension == 'aiff' ||
            song.fileExtension == 'wma';
      }).toList();
    } else {
      // Fallback to check permissions again
      await checkPermission();
      throw Exception("Storage permission not granted");
    }
  }
}
