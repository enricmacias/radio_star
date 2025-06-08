import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/views/favorite/favorite_view.dart';
import 'package:radio_star/views/search/search_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'mini_player_view.dart';

part 'home_view.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() => 0;

  void onDestinationSelected(int index) {
    state = index;
  }
}

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int pageIndex = ref.watch(pageIndexProvider);

    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MiniPlayerView(),
          NavigationBar(
            onDestinationSelected: (int index) {
              ref.read(pageIndexProvider.notifier).onDestinationSelected(index);
            },
            selectedIndex: pageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.search),
                icon: Icon(Icons.search_outlined),
                label: 'Search',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.star),
                icon: Icon(Icons.star_outline),
                label: 'Favorite Stations',
              ),
            ],
          ),
        ],
      ),
      body: <Widget>[SearchView(), FavoriteView()][pageIndex],
    );
  }
}
