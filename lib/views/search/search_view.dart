import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/providers/search/search_providers.dart';
import 'package:radio_star/views/common/radio_station_cell_view.dart';

class AbortedException implements Exception {}

const searchedName = 'hi';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(radioStationCountProvider(searchedName))
        .when(
          loading:
              () => Container(
                color: Colors.white,
                child: const Center(child: CircularProgressIndicator()),
              ),
          error: (err, stack) {
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: Center(
                child: Text(switch (err) {
                  DioException() => err.message ?? '$err',
                  _ => '$err',
                }),
              ),
            );
          },
          data: (radioStationsCount) {
            return SafeArea(
              child: Scaffold(
                body: ListView.builder(
                  itemCount: radioStationsCount,
                  itemBuilder: (context, index) {
                    final stationAsync = ref.watch(
                      radioStationAtIndexProvider(searchedName, index),
                    );
                    return stationAsync.when(
                      loading:
                          () =>
                              const ListTile(title: LinearProgressIndicator()),
                      error:
                          (err, stack) => ListTile(title: Text('Error: $err')),
                      data:
                          (radioStation) => ProviderScope(
                            overrides: [
                              radioStationsIndexProvider.overrideWithValue(
                                index,
                              ),
                            ],
                            child: RadioStationCellView(
                              index: index,
                              radioStation: radioStation,
                            ),
                          ),
                    );
                  },
                ),
              ),
            );
          },
        );
  }
}
