import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/providers/favorite/favorite_providers.dart';
import 'package:radio_star/views/player/play_pause_button_view.dart';
import '../../providers/player/player_provider.dart';

class PlayerView extends ConsumerWidget {
  const PlayerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStation = ref.watch(currentRadioStationProvider);
    final favorites = ref.watch(favoriteStationsProvider);

    final stationName = currentStation?.name ?? 'No Station';
    final favicon = currentStation?.favicon;
    final isFavorite =
        currentStation != null &&
        favorites.any((s) => s.url == currentStation.url);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Now Playing'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 1,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.deepPurple : null,
            ),
            tooltip: 'Favorite',
            onPressed:
                currentStation == null
                    ? null
                    : () {
                      if (isFavorite) {
                        ref
                            .read(favoriteStationsProvider.notifier)
                            .removeFavorite(currentStation);
                      } else {
                        ref
                            .read(favoriteStationsProvider.notifier)
                            .addFavorite(currentStation);
                      }
                    },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Big thumbnail image
            Center(
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child:
                    (favicon != null && favicon.isNotEmpty)
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            favicon,
                            width: 240,
                            height: 240,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => const Icon(
                                  Icons.music_note,
                                  size: 120,
                                  color: Colors.grey,
                                ),
                          ),
                        )
                        : const Icon(
                          Icons.music_note,
                          size: 120,
                          color: Colors.grey,
                        ),
              ),
            ),
            const SizedBox(height: 32),
            // Radio Station Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  stationName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Spacer(),
            PlayPauseButtonView(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
