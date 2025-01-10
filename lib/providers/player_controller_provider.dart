import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

// Audio Query Provider for accessing the audio query functionality
final audioQueryProvider = Provider<OnAudioQuery>((ref) {
  return OnAudioQuery();
});

// Permission Notifier Provider
final permissionNotifierProvider =
    AsyncNotifierProvider<PermissionNotifier, bool>(() {
  return PermissionNotifier();
});

// Permission Notifier class to manage permission checking
class PermissionNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    return await checkPermission();
  }

  // Method to check storage permission
  Future<bool> checkPermission() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    }
    // Request permission if not granted
    return await Permission.storage.request().isGranted;
  }

  // Method to fetch songs after checking permission
  Future<List<SongModel>> fetchSongsWithPermissionCheck() async {
    final audioQuery = ref.read(audioQueryProvider);

    // Check permission first
    final permissionGranted = await checkPermission();
    if (!permissionGranted) {
      throw Exception("Storage permission not granted");
    }

    // Query songs only if permission is granted
    List<SongModel> songs = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );

    // Filter out non-music files based on file extensions (mp3, wav, etc.)
    return songs.where((song) {
      return song.fileExtension == 'mp3' ||
          song.fileExtension == 'wav' ||
          song.fileExtension == 'aac' ||
          song.fileExtension == 'flac' ||
          song.fileExtension == 'ogg' ||
          song.fileExtension == 'm4a' ||
          song.fileExtension == 'aiff' ||
          song.fileExtension == 'wma';
    }).toList();
  }
}
