import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_view_model.g.dart';

@riverpod
class Player extends _$Player {
  @override
  AudioPlayer build() => AudioPlayer();

  Future<void> init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    state.errorStream.listen((e) {
      print('A stream error occurred: $e');
    });
    try {
      // Use the provided radio stream URL
      await state.setAudioSource(
        AudioSource.uri(
          Uri.parse("https://s2-webradio.antenne.de/chillout?icy=https"),
        ),
      );
    } on PlayerException catch (e) {
      print("Error loading audio source: $e");
    }
  }

  Future<void> onAudioSourceChanged(String url) async {
    try {
      await state.setAudioSource(AudioSource.uri(Uri.parse(url)));
    } on PlayerException catch (e) {
      print("Error changing audio source: $e");
    }
  }
}
