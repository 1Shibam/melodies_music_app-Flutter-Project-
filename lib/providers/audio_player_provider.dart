import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider = AutoDisposeProvider<AudioPlayer>(
  (ref) {
    final player = AudioPlayer();
    ref.onDispose(() {
      player.dispose();
    });
    return player;
  },
);
void playSong(WidgetRef ref, String uri) {
  final audioPlayer = ref.read(audioPlayerProvider);
  audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri)));
  audioPlayer.play();
}
