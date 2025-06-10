// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentRadioStationHash() =>
    r'20268a6e50cb6cc31ce94782cf61c216f9e42550';

/// See also [CurrentRadioStation].
@ProviderFor(CurrentRadioStation)
final currentRadioStationProvider =
    AutoDisposeNotifierProvider<CurrentRadioStation, RadioStation?>.internal(
      CurrentRadioStation.new,
      name: r'currentRadioStationProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentRadioStationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentRadioStation = AutoDisposeNotifier<RadioStation?>;
String _$playerHash() => r'b15b2d3e86afdb7848ffde70b6e242fe23da9142';

/// See also [Player].
@ProviderFor(Player)
final playerProvider =
    AutoDisposeNotifierProvider<Player, AudioPlayer>.internal(
      Player.new,
      name: r'playerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$playerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Player = AutoDisposeNotifier<AudioPlayer>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
