import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melodies_music_app/services/audio_Service.dart';

final audioProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  final audioService = AudioService();
  return await audioService.fetchAudioFiles();
});
