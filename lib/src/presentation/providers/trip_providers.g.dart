// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tripDataSourceHash() => r'583889c1b3c0c4f2959dfbe79539d620f84d3dc3';

/// See also [tripDataSource].
@ProviderFor(tripDataSource)
final tripDataSourceProvider = AutoDisposeProvider<TripDataSource>.internal(
  tripDataSource,
  name: r'tripDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TripDataSourceRef = AutoDisposeProviderRef<TripDataSource>;
String _$tripRepositoryHash() => r'fe64a04763ac0b07aa4bea700716558ecba26432';

/// See also [tripRepository].
@ProviderFor(tripRepository)
final tripRepositoryProvider = AutoDisposeProvider<TripRepository>.internal(
  tripRepository,
  name: r'tripRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TripRepositoryRef = AutoDisposeProviderRef<TripRepository>;
String _$getTripsUseCaseHash() => r'26c2e9726b4237e58f9b0ad6d65d12e70e6d9eee';

/// See also [getTripsUseCase].
@ProviderFor(getTripsUseCase)
final getTripsUseCaseProvider = AutoDisposeProvider<GetTripsUseCase>.internal(
  getTripsUseCase,
  name: r'getTripsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTripsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTripsUseCaseRef = AutoDisposeProviderRef<GetTripsUseCase>;
String _$getTripByIdUseCaseHash() =>
    r'ee3b5ff9226ce7b47a36f9f5619e870baf15bcc5';

/// See also [getTripByIdUseCase].
@ProviderFor(getTripByIdUseCase)
final getTripByIdUseCaseProvider =
    AutoDisposeProvider<GetTripByIdUseCase>.internal(
      getTripByIdUseCase,
      name: r'getTripByIdUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getTripByIdUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTripByIdUseCaseRef = AutoDisposeProviderRef<GetTripByIdUseCase>;
String _$tripsHash() => r'59659ba8bc2887c19374d1bc74f5b1b24768c86d';

/// See also [trips].
@ProviderFor(trips)
final tripsProvider = AutoDisposeFutureProvider<List<TripEntity>>.internal(
  trips,
  name: r'tripsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TripsRef = AutoDisposeFutureProviderRef<List<TripEntity>>;
String _$tripByIdHash() => r'a486fcacd4216e3d6cbe7894285baee5df300243';

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

/// See also [tripById].
@ProviderFor(tripById)
const tripByIdProvider = TripByIdFamily();

/// See also [tripById].
class TripByIdFamily extends Family<AsyncValue<TripEntity?>> {
  /// See also [tripById].
  const TripByIdFamily();

  /// See also [tripById].
  TripByIdProvider call(String id) {
    return TripByIdProvider(id);
  }

  @override
  TripByIdProvider getProviderOverride(covariant TripByIdProvider provider) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tripByIdProvider';
}

/// See also [tripById].
class TripByIdProvider extends AutoDisposeFutureProvider<TripEntity?> {
  /// See also [tripById].
  TripByIdProvider(String id)
    : this._internal(
        (ref) => tripById(ref as TripByIdRef, id),
        from: tripByIdProvider,
        name: r'tripByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$tripByIdHash,
        dependencies: TripByIdFamily._dependencies,
        allTransitiveDependencies: TripByIdFamily._allTransitiveDependencies,
        id: id,
      );

  TripByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<TripEntity?> Function(TripByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TripByIdProvider._internal(
        (ref) => create(ref as TripByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TripEntity?> createElement() {
    return _TripByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TripByIdRef on AutoDisposeFutureProviderRef<TripEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TripByIdProviderElement
    extends AutoDisposeFutureProviderElement<TripEntity?>
    with TripByIdRef {
  _TripByIdProviderElement(super.provider);

  @override
  String get id => (origin as TripByIdProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
