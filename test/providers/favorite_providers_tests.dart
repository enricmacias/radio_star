import 'package:flutter_test/flutter_test.dart';
import 'package:radio_star/models/radio_station.dart';
import 'package:radio_star/providers/favorite/favorite_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FavoriteStations', () {
    late ProviderContainer container;
    late RadioStation testStation;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      container = ProviderContainer();
      testStation = RadioStation(
        stationuuid: 'test-uuid',
        name: 'Test Station',
        url: 'https://test.url',
        favicon: 'https://test.img',
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is empty', () async {
      final favorites = container.read(favoriteStationsProvider);
      expect(favorites, isEmpty);
    });

    test('addFavorite adds a station', () async {
      final notifier = container.read(favoriteStationsProvider.notifier);
      await notifier.addFavorite(testStation);

      final favorites = container.read(favoriteStationsProvider);
      expect(favorites.length, 1);
      expect(favorites.first.name, 'Test Station');
    });

    test('addFavorite does not add duplicates', () async {
      final notifier = container.read(favoriteStationsProvider.notifier);
      await notifier.addFavorite(testStation);
      await notifier.addFavorite(testStation);

      final favorites = container.read(favoriteStationsProvider);
      expect(favorites.length, 1);
    });

    test('removeFavorite removes a station', () async {
      final notifier = container.read(favoriteStationsProvider.notifier);
      await notifier.addFavorite(testStation);
      await notifier.removeFavorite(testStation);

      final favorites = container.read(favoriteStationsProvider);
      expect(favorites, isEmpty);
    });

    test('favoritesListProvider returns the correct list', () async {
      final notifier = container.read(favoriteStationsProvider.notifier);
      await notifier.addFavorite(testStation);

      final favorites = await container.read(favoritesListProvider.future);
      expect(favorites.length, 1);
      expect(favorites.first.name, 'Test Station');
    });
  });
}
