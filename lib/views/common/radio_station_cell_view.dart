import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/models/radio_station.dart';
import '../../providers/player/player_provider.dart';

// State provider to keep track of the selected index
final selectedRadioStationIndexProvider = StateProvider<int?>((ref) => null);

class RadioStationCellView extends ConsumerWidget {
  final int index;
  final RadioStation radioStation;

  const RadioStationCellView({
    super.key,
    required this.index,
    required this.radioStation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedRadioStationIndexProvider);
    final isSelected = selectedIndex == index;

    return Ink(
      color: isSelected ? Colors.yellow : Colors.transparent,
      child: ListTile(
        leading:
            radioStation.favicon.isNotEmpty
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    radioStation.favicon,
                    width: 40,
                    height: 40,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.radio),
                  ),
                )
                : const Icon(Icons.radio),
        title: Text(radioStation.name),
        onTap: () {
          ref.read(selectedRadioStationIndexProvider.notifier).state = index;
          ref
              .read(currentRadioStationProvider.notifier)
              .onRadioStationSelected(radioStation);
          ref.read(playerProvider.notifier).onAudioSourceChanged(radioStation);
          ref.watch(playerProvider).play();
        },
      ),
    );
  }
}
