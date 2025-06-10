import 'package:freezed_annotation/freezed_annotation.dart';

part 'radio_station.freezed.dart';
part 'radio_station.g.dart';

@freezed
sealed class RadioStation with _$RadioStation {
  factory RadioStation({
    required String stationuuid,
    required String name,
    required String url,
    required String favicon,
  }) = _RadioStation;

  factory RadioStation.fromJson(Map<String, Object?> json) =>
      _$RadioStationFromJson(json);
}
