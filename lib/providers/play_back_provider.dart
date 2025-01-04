import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PlaybackState { stopped, playing, paused }

final playbackProvider = StateProvider<PlaybackState>((ref) {
  return PlaybackState.stopped;
});

final currentTrackProvider = StateProvider<String?>((ref) {
  return null; // No track is playing initially
});
