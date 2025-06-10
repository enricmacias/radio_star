import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/providers/home/page_index_provider.dart';

void main() {
  group('PageIndexProvider', () {
    test('initial value is 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final index = container.read(pageIndexProvider);
      expect(index, 0);
    });

    test('can update the page index', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(pageIndexProvider.notifier);
      notifier.state = 2;

      final index = container.read(pageIndexProvider);
      expect(index, 2);
    });

    test('can increment and decrement the page index', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(pageIndexProvider.notifier);

      notifier.state = 1;
      expect(container.read(pageIndexProvider), 1);

      notifier.state++;
      expect(container.read(pageIndexProvider), 2);

      notifier.state--;
      expect(container.read(pageIndexProvider), 1);
    });
  });
}
