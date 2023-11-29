// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_playlist_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createPlaylistLoaderHash() =>
    r'd29a90b4774c9f8169baba5981b8156b99e68f98';

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

/// See also [createPlaylistLoader].
@ProviderFor(createPlaylistLoader)
const createPlaylistLoaderProvider = CreatePlaylistLoaderFamily();

/// See also [createPlaylistLoader].
class CreatePlaylistLoaderFamily extends Family<AsyncValue<void>> {
  /// See also [createPlaylistLoader].
  const CreatePlaylistLoaderFamily();

  /// See also [createPlaylistLoader].
  CreatePlaylistLoaderProvider call(
    BuildContext context,
  ) {
    return CreatePlaylistLoaderProvider(
      context,
    );
  }

  @override
  CreatePlaylistLoaderProvider getProviderOverride(
    covariant CreatePlaylistLoaderProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createPlaylistLoaderProvider';
}

/// See also [createPlaylistLoader].
class CreatePlaylistLoaderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createPlaylistLoader].
  CreatePlaylistLoaderProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => createPlaylistLoader(
            ref as CreatePlaylistLoaderRef,
            context,
          ),
          from: createPlaylistLoaderProvider,
          name: r'createPlaylistLoaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createPlaylistLoaderHash,
          dependencies: CreatePlaylistLoaderFamily._dependencies,
          allTransitiveDependencies:
              CreatePlaylistLoaderFamily._allTransitiveDependencies,
          context: context,
        );

  CreatePlaylistLoaderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreatePlaylistLoaderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatePlaylistLoaderProvider._internal(
        (ref) => create(ref as CreatePlaylistLoaderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreatePlaylistLoaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePlaylistLoaderProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreatePlaylistLoaderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _CreatePlaylistLoaderProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with CreatePlaylistLoaderRef {
  _CreatePlaylistLoaderProviderElement(super.provider);

  @override
  BuildContext get context => (origin as CreatePlaylistLoaderProvider).context;
}

String _$createPlaylistControllerHash() =>
    r'c6c02fb4e309be37df67c471aa4ed542639530b9';

/// See also [CreatePlaylistController].
@ProviderFor(CreatePlaylistController)
final createPlaylistControllerProvider =
    AutoDisposeNotifierProvider<CreatePlaylistController, void>.internal(
  CreatePlaylistController.new,
  name: r'createPlaylistControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createPlaylistControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreatePlaylistController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
