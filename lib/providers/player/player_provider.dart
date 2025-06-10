import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_star/models/radio_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_provider.g.dart';

@riverpod
class CurrentRadioStation extends _$CurrentRadioStation {
  @override
  RadioStation? build() => null;

  void onRadioStationSelected(RadioStation radioStation) {
    state = radioStation;
  }
}

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
  }

  Future<void> onAudioSourceChanged(RadioStation radioStation) async {
    try {
      await state.setAudioSource(AudioSource.uri(Uri.parse(radioStation.url)));
    } on PlayerException catch (e) {
      print("Error changing audio source: $e");
    }
  }
}
