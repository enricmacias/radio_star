import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/providers/favorite/favorite_providers.dart';
import 'package:radio_star/views/common/radio_station_cell_view.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(favoritesListProvider)
        .when(
          loading:
              () => Container(
                color: Colors.white,
                child: const Center(child: CircularProgressIndicator()),
              ),
          error: (err, stack) {
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: Center(child: Text('$err')),
            );
          },
          data: (favorites) {
            return SafeArea(
              child: Scaffold(
                body: ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final station = favorites[index];
                    return RadioStationCellView(
                      index: index, // Not needed for favorites
                      radioStation: station,
                    );
                  },
                ),
              ),
            );
          },
        );
  }
}
