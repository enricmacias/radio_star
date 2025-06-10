import 'package:flutter_test/flutter_test.dart';
import 'package:radio_star/models/radio_station.dart';
import 'package:radio_star/providers/player/player_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CurrentRadioStation', () {
    test('initial state is null', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final station = container.read(currentRadioStationProvider);
      expect(station, isNull);
    });

    test('onRadioStationSelected updates the state', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(currentRadioStationProvider.notifier);
      final testStation = RadioStation(
        stationuuid: 'test-uuid',
        name: 'Test Station',
        url: 'https://test.url',
        favicon: 'https://test.img',
      );
      notifier.onRadioStationSelected(testStation);

      final station = container.read(currentRadioStationProvider);
      expect(station, isNotNull);
      expect(station!.name, 'Test Station');
      expect(station.url, 'https://test.url');
      expect(station.favicon, 'https://test.img');
    });
  });

  group('Player', () {
    test('build returns an AudioPlayer', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final player = container.read(playerProvider);
      expect(player, isA<AudioPlayer>());
    });

    test(
      'onAudioSourceChanged sets audio source and updates current station',
      () async {
        final container = ProviderContainer();
        addTearDown(container.dispose);

        final notifier = container.read(playerProvider.notifier);
        final testStation = RadioStation(
          stationuuid: 'test-uuid',
          name: 'Test Station',
          url: 'https://test.url',
          favicon: 'https://test.img',
        );

        // Should not throw
        await notifier.onAudioSourceChanged(testStation);

        // CurrentRadioStation should be updated
        final station = container.read(currentRadioStationProvider);
        expect(station, isNotNull);
        expect(station!.name, 'Test Station');
      },
    );
  });
}
