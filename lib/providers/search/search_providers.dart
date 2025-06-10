import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/models/radio_station.dart';
import 'package:radio_star/models/radio_stations_list_response.dart';
import 'package:radio_star/repository/radio_browser_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_providers.g.dart';

class AbortedException implements Exception {}

@riverpod
Future<RadioStationsListResponse> radioStations(
  Ref ref,
  String searchedName,
) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  // Debouncing the request. By having this delay, it leaves the opportunity
  // for consumers to subscribe to a different `meta` parameters. In which
  // case, this request will be aborted.
  await Future<void>.delayed(const Duration(milliseconds: 250));
  if (cancelToken.isCancelled) throw AbortedException();

  final repository = ref.watch(radioBrowserRepositoryProvider);
  final radioStationResponse = await repository.searchByName(
    nameStartsWith: searchedName,
    cancelToken: cancelToken,
  );
  return radioStationResponse;
}

@riverpod
Future<int> radioStationCount(Ref ref, String searchedName) async {
  final response = await ref.watch(radioStationsProvider(searchedName).future);
  return response.totalCount;
}

@riverpod
int radioStationsIndex(Ref ref) {
  return throw UnimplementedError();
}

@riverpod
Future<RadioStation> radioStationAtIndex(
  Ref ref,
  String searchedName,
  int index,
) async {
  final response = await ref.watch(radioStationsProvider(searchedName).future);
  return response.radioStations[index];
}

@riverpod
class SearchedNameProvider extends _$SearchedNameProvider {
  @override
  String build() => '';

  void onTextChanged(String text) {
    state = text;
  }
}
