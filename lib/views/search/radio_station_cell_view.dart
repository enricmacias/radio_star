import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/search/search_providers.dart';
import '../../providers/player/player_provider.dart';

// State provider to keep track of the selected index
final selectedRadioStationIndexProvider = StateProvider<int?>((ref) => null);

class RadioStationCellView extends ConsumerWidget {
  final int index;
  final String searchedName;

  const RadioStationCellView({
    super.key,
    required this.index,
    required this.searchedName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stationAsync = ref.watch(
      radioStationAtIndexProvider(searchedName, index),
    );
    final selectedIndex = ref.watch(selectedRadioStationIndexProvider);

    return stationAsync.when(
      loading:
          () => const Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(),
          ),
      error:
          (err, stack) => Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Error $err'),
          ),
      data: (station) {
        final isSelected = selectedIndex == index;
        return Ink(
          color: isSelected ? Colors.yellow : Colors.transparent,
          child: ListTile(
            leading:
                station.favicon.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        station.favicon,
                        width: 40,
                        height: 40,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.radio),
                      ),
                    )
                    : const Icon(Icons.radio),
            title: Text(station.name),
            onTap: () {
              ref.read(selectedRadioStationIndexProvider.notifier).state =
                  index;
              ref
                  .read(playerProvider.notifier)
                  .onAudioSourceChanged(station.url);
              ref.watch(playerProvider).play();
            },
          ),
        );
      },
    );
  }
}
