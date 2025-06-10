import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio_star/models/radio_station.dart';
import 'package:radio_star/models/radio_stations_list_response.dart';
import 'package:radio_star/providers/search/search_providers.dart';

class RadioBrowserRepository {
  RadioBrowserRepository(this.ref);

  final Ref ref;
  final _radioStationCache = <String, RadioStation>{};

  Future<RadioStationsListResponse> searchByName({
    String? nameStartsWith,
    CancelToken? cancelToken,
  }) async {
    final cleanNameFilter = nameStartsWith?.trim();

    final result = await _get(
      'search?name=$cleanNameFilter',
      cancelToken: cancelToken,
    );
    for (final radioStation in result.radioStations) {
      _radioStationCache[radioStation.stationuuid] = radioStation;
    }
    // TODO: remove this print statement in production
    // This print statement is for debugging purposes to see the fetched radio stations.
    print(result);
    return result;
  }

  Future<RadioStationsListResponse> _get(
    String path, {
    CancelToken? cancelToken,
  }) async {
    final result = await ref
        .read(dioProvider)
        .get<String>(
          'http://fi1.api.radio-browser.info/json/stations/$path',
          cancelToken: cancelToken,
          // TO-DO deserialize error message
        );

    final data =
        (json.decode(result.data ?? '[]') as List).cast<Map<String, Object?>>();

    final list = RadioStationsListResponse(
      radioStations: data
          .map((e) {
            return RadioStation.fromJson(e);
          })
          .toList(growable: false),
      totalCount: data.length,
    );

    return list;
  }
}
