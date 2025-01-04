import 'package:flutter/services.dart';

class AudioService {
  static const platform = MethodChannel('com.example.musicplayer/media');

  Future<List<Map<String, String>>> fetchAudioFiles() async {
    try {
      final List<dynamic> result = await platform.invokeMethod('getAudioFiles');
      return result.map((file) => Map<String, String>.from(file)).toList();
    } catch (e) {
      print('Error fetching audio files: $e');
      return [];
    }
  }
}
