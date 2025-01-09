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
late int playIndex;
void playSong(WidgetRef ref, String uri, index) {
  playIndex = index;
  final audioPlayer = ref.read(audioPlayerProvider);
  audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri)));
  audioPlayer.play();
}
