// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'70622372c4de6e770ba489d17cc1d9d4ee482e59';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$radioBrowserRepositoryHash() =>
    r'7c752d5abd6fd62326bb26c370ed8b03ced6530a';

/// See also [radioBrowserRepository].
@ProviderFor(radioBrowserRepository)
final radioBrowserRepositoryProvider =
    AutoDisposeProvider<RadioBrowserRepository>.internal(
      radioBrowserRepository,
      name: r'radioBrowserRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$radioBrowserRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RadioBrowserRepositoryRef =
    AutoDisposeProviderRef<RadioBrowserRepository>;
String _$radioStationsHash() => r'a99f6972a8b1e9c0b863d3e747f0c18fe9d46e7a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [radioStations].
@ProviderFor(radioStations)
const radioStationsProvider = RadioStationsFamily();

/// See also [radioStations].
class RadioStationsFamily
    extends Family<AsyncValue<RadioStationsListResponse>> {
  /// See also [radioStations].
  const RadioStationsFamily();

  /// See also [radioStations].
  RadioStationsProvider call(String searchedName) {
    return RadioStationsProvider(searchedName);
  }

  @override
  RadioStationsProvider getProviderOverride(
    covariant RadioStationsProvider provider,
  ) {
    return call(provider.searchedName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'radioStationsProvider';
}

/// See also [radioStations].
class RadioStationsProvider
    extends AutoDisposeFutureProvider<RadioStationsListResponse> {
  /// See also [radioStations].
  RadioStationsProvider(String searchedName)
    : this._internal(
        (ref) => radioStations(ref as RadioStationsRef, searchedName),
        from: radioStationsProvider,
        name: r'radioStationsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$radioStationsHash,
        dependencies: RadioStationsFamily._dependencies,
        allTransitiveDependencies:
            RadioStationsFamily._allTransitiveDependencies,
        searchedName: searchedName,
      );

  RadioStationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchedName,
  }) : super.internal();

  final String searchedName;

  @override
  Override overrideWith(
    FutureOr<RadioStationsListResponse> Function(RadioStationsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RadioStationsProvider._internal(
        (ref) => create(ref as RadioStationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchedName: searchedName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RadioStationsListResponse> createElement() {
    return _RadioStationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RadioStationsProvider && other.searchedName == searchedName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchedName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RadioStationsRef
    on AutoDisposeFutureProviderRef<RadioStationsListResponse> {
  /// The parameter `searchedName` of this provider.
  String get searchedName;
}

class _RadioStationsProviderElement
    extends AutoDisposeFutureProviderElement<RadioStationsListResponse>
    with RadioStationsRef {
  _RadioStationsProviderElement(super.provider);

  @override
  String get searchedName => (origin as RadioStationsProvider).searchedName;
}

String _$radioStationCountHash() => r'34b4f15cbfb0b7e6a183bc1adb9e4b5df1acc529';

/// See also [radioStationCount].
@ProviderFor(radioStationCount)
const radioStationCountProvider = RadioStationCountFamily();

/// See also [radioStationCount].
class RadioStationCountFamily extends Family<AsyncValue<int>> {
  /// See also [radioStationCount].
  const RadioStationCountFamily();

  /// See also [radioStationCount].
  RadioStationCountProvider call(String searchedName) {
    return RadioStationCountProvider(searchedName);
  }

  @override
  RadioStationCountProvider getProviderOverride(
    covariant RadioStationCountProvider provider,
  ) {
    return call(provider.searchedName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'radioStationCountProvider';
}

/// See also [radioStationCount].
class RadioStationCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [radioStationCount].
  RadioStationCountProvider(String searchedName)
    : this._internal(
        (ref) => radioStationCount(ref as RadioStationCountRef, searchedName),
        from: radioStationCountProvider,
        name: r'radioStationCountProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$radioStationCountHash,
        dependencies: RadioStationCountFamily._dependencies,
        allTransitiveDependencies:
            RadioStationCountFamily._allTransitiveDependencies,
        searchedName: searchedName,
      );

  RadioStationCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchedName,
  }) : super.internal();

  final String searchedName;

  @override
  Override overrideWith(
    FutureOr<int> Function(RadioStationCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RadioStationCountProvider._internal(
        (ref) => create(ref as RadioStationCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchedName: searchedName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _RadioStationCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RadioStationCountProvider &&
        other.searchedName == searchedName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchedName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RadioStationCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `searchedName` of this provider.
  String get searchedName;
}

class _RadioStationCountProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with RadioStationCountRef {
  _RadioStationCountProviderElement(super.provider);

  @override
  String get searchedName => (origin as RadioStationCountProvider).searchedName;
}

String _$radioStationsIndexHash() =>
    r'7f64681f777823756f82d3d67bf81fc7a5585fb5';

/// See also [radioStationsIndex].
@ProviderFor(radioStationsIndex)
final radioStationsIndexProvider = AutoDisposeProvider<int>.internal(
  radioStationsIndex,
  name: r'radioStationsIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$radioStationsIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RadioStationsIndexRef = AutoDisposeProviderRef<int>;
String _$radioStationAtIndexHash() =>
    r'31dc5bc44c1065830c697e9fedd35587e953765c';

/// See also [radioStationAtIndex].
@ProviderFor(radioStationAtIndex)
const radioStationAtIndexProvider = RadioStationAtIndexFamily();

/// See also [radioStationAtIndex].
class RadioStationAtIndexFamily extends Family<AsyncValue<RadioStation>> {
  /// See also [radioStationAtIndex].
  const RadioStationAtIndexFamily();

  /// See also [radioStationAtIndex].
  RadioStationAtIndexProvider call(String searchedName, int index) {
    return RadioStationAtIndexProvider(searchedName, index);
  }

  @override
  RadioStationAtIndexProvider getProviderOverride(
    covariant RadioStationAtIndexProvider provider,
  ) {
    return call(provider.searchedName, provider.index);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'radioStationAtIndexProvider';
}

/// See also [radioStationAtIndex].
class RadioStationAtIndexProvider
    extends AutoDisposeFutureProvider<RadioStation> {
  /// See also [radioStationAtIndex].
  RadioStationAtIndexProvider(String searchedName, int index)
    : this._internal(
        (ref) => radioStationAtIndex(
          ref as RadioStationAtIndexRef,
          searchedName,
          index,
        ),
        from: radioStationAtIndexProvider,
        name: r'radioStationAtIndexProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$radioStationAtIndexHash,
        dependencies: RadioStationAtIndexFamily._dependencies,
        allTransitiveDependencies:
            RadioStationAtIndexFamily._allTransitiveDependencies,
        searchedName: searchedName,
        index: index,
      );

  RadioStationAtIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchedName,
    required this.index,
  }) : super.internal();

  final String searchedName;
  final int index;

  @override
  Override overrideWith(
    FutureOr<RadioStation> Function(RadioStationAtIndexRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RadioStationAtIndexProvider._internal(
        (ref) => create(ref as RadioStationAtIndexRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchedName: searchedName,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RadioStation> createElement() {
    return _RadioStationAtIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RadioStationAtIndexProvider &&
        other.searchedName == searchedName &&
        other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchedName.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RadioStationAtIndexRef on AutoDisposeFutureProviderRef<RadioStation> {
  /// The parameter `searchedName` of this provider.
  String get searchedName;

  /// The parameter `index` of this provider.
  int get index;
}

class _RadioStationAtIndexProviderElement
    extends AutoDisposeFutureProviderElement<RadioStation>
    with RadioStationAtIndexRef {
  _RadioStationAtIndexProviderElement(super.provider);

  @override
  String get searchedName =>
      (origin as RadioStationAtIndexProvider).searchedName;
  @override
  int get index => (origin as RadioStationAtIndexProvider).index;
}

String _$searchedNameHash() => r'03369f37725f7a6a589dde1e93b5396cc3991c8c';

/// See also [SearchedName].
@ProviderFor(SearchedName)
final searchedNameProvider =
    AutoDisposeNotifierProvider<SearchedName, String>.internal(
      SearchedName.new,
      name: r'searchedNameProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$searchedNameHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchedName = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
