// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesListHash() => r'aa3200791d5156435303a97e0daf0095aefdaeb2';

/// See also [favoritesList].
@ProviderFor(favoritesList)
final favoritesListProvider = FutureProvider<List<RadioStation>>.internal(
  favoritesList,
  name: r'favoritesListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoritesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoritesListRef = FutureProviderRef<List<RadioStation>>;
String _$favoriteStationsHash() => r'4c1be544038d2c466e1414ec141a1e2761567c9f';

/// See also [FavoriteStations].
@ProviderFor(FavoriteStations)
final favoriteStationsProvider =
    NotifierProvider<FavoriteStations, List<RadioStation>>.internal(
      FavoriteStations.new,
      name: r'favoriteStationsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$favoriteStationsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FavoriteStations = Notifier<List<RadioStation>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
