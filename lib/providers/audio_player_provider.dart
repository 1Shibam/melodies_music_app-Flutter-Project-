// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

// Audio Player Provider to manage the player instance
final audioPlayerProvider = AutoDisposeProvider<AudioPlayer>(
  (ref) {
    final player = AudioPlayer();
    ref.onDispose(() {
      player.dispose();
    });
    return player;
  },
);

// StateNotifier to track the audio playback state
final playbackStateProvider = StateNotifierProvider<PlaybackStateNotifier, PlaybackState>(
  (ref) => PlaybackStateNotifier(),
);

// Enum to define the playback state
enum PlaybackState { stopped, playing, paused }

// PlaybackStateNotifier to manage playback state
class PlaybackStateNotifier extends StateNotifier<PlaybackState> {
  PlaybackStateNotifier() : super(PlaybackState.stopped);

  // Method to set the state to playing
  void play() => state = PlaybackState.playing;

  // Method to set the state to paused
  void pause() => state = PlaybackState.paused;

  // Method to set the state to stopped
  void stop() => state = PlaybackState.stopped;
}

late int playIndex;

// Play the song and handle the playback state
void playSong(WidgetRef ref, String uri, int index) async {
  playIndex = index;

  final audioPlayer = ref.read(audioPlayerProvider);
  final playbackState = ref.read(playbackStateProvider.notifier);

  try {
    // Set the audio source
    await audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri)));

    // Play the song and update the playback state
    await audioPlayer.play();
    playbackState.play();
  } catch (e) {
    // Handle any errors during playback (e.g., invalid URI)
    print("Error playing song: $e");
    playbackState.stop(); // Stop in case of error
  }
}

// Toggle play/pause functionality
void togglePlayPause(WidgetRef ref) {
  final audioPlayer = ref.read(audioPlayerProvider);
  final playbackState = ref.read(playbackStateProvider.notifier);

  if (audioPlayer.playing) {
    audioPlayer.pause();
    playbackState.pause();
  } else {
    audioPlayer.play();
    playbackState.play();
  }
}

// Skip to the next song (or loop functionality if you prefer)
void skipToNext(WidgetRef ref) async {
  final audioPlayer = ref.read(audioPlayerProvider);
  final playbackState = ref.read(playbackStateProvider.notifier);

  try {
    // You can implement logic for loading the next song
    // Here we just stop and reset the player (you can queue songs if needed)
    await audioPlayer.stop();
    playbackState.stop(); // Stop playback state
  } catch (e) {
    print("Error skipping to next song: $e");
  }
}
