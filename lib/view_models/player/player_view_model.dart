import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_view_model.g.dart';

@riverpod
class RadioPlayer extends _$RadioPlayer {
  @override
  FlutterRadioPlayer build() => FlutterRadioPlayer();

  void onVolumeChanged(double volume) {
    state.setVolume(volume);
  }

  void onSourceChanged(String url) {}
}
