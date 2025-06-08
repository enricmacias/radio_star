import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
        bottomNavigationBar: NavigationBar(
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
            label: 'Favorites',
          ),
        ]),
        body:
          <Widget>[
            Card(
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(child: Text('Search page')),
        ),
      ),
            Card(
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(child: Text('Favorite page')),
        ),
      ),
            ][pageIndex],
      );
    }
}