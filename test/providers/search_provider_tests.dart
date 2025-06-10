import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/providers/search/search_providers.dart';
import 'package:radio_star/models/radio_station.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('searchedNameProvider', () {
    test('initial value is empty string', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(searchedNameProvider), '');
    });

    test('can be updated', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(searchedNameProvider.notifier).state = 'test';
      expect(container.read(searchedNameProvider), 'test');
    });
  });

  group('radioStationCountProvider', () {
    test('returns an int (count) for a search', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // This will depend on your implementation and backend.
      // For a real backend, you may want to mock the repository.
      final count = await container.read(
        radioStationCountProvider('test').future,
      );
      expect(count, isA<int>());
      expect(count, greaterThanOrEqualTo(0));
    });
  });

  group('radioStationAtIndexProvider', () {
    test('returns a RadioStation for a valid index', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final count = await container.read(
        radioStationCountProvider('test').future,
      );
      if (count > 0) {
        final station = await container.read(
          radioStationAtIndexProvider('test', 0).future,
        );
        expect(station, isA<RadioStation>());
        expect(station.name, isNotEmpty);
      }
    });

    test('throws or returns error for invalid index', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final count = await container.read(
        radioStationCountProvider('test').future,
      );
      // Try to access an out-of-bounds index
      if (count == 0) {
        // If no stations, expect an error
        expect(
          () => container.read(radioStationAtIndexProvider('test', 0).future),
          throwsA(isA<Exception>()),
        );
      } else {
        // If stations exist, out-of-bounds
        expect(
          () => container.read(
            radioStationAtIndexProvider('test', count + 10).future,
          ),
          throwsA(isA<Exception>()),
        );
      }
    });
  });
}
