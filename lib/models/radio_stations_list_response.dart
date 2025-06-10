import 'package:freezed_annotation/freezed_annotation.dart';

import 'radio_station.dart';

part 'radio_stations_list_response.freezed.dart';

@freezed
sealed class RadioStationsListResponse with _$RadioStationsListResponse {
  factory RadioStationsListResponse({
    required int totalCount,
    required List<RadioStation> radioStations,
  }) = _RadioStationsListResponse;
}
