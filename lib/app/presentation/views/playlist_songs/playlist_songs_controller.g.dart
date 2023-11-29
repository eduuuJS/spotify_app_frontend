// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_songs_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playlistSongLoaderHash() =>
    r'c7f0bb3142ae731a82175a41e4fc5a8df9884aab';

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

/// See also [playlistSongLoader].
@ProviderFor(playlistSongLoader)
const playlistSongLoaderProvider = PlaylistSongLoaderFamily();

/// See also [playlistSongLoader].
class PlaylistSongLoaderFamily extends Family<AsyncValue<void>> {
  /// See also [playlistSongLoader].
  const PlaylistSongLoaderFamily();

  /// See also [playlistSongLoader].
  PlaylistSongLoaderProvider call(
    String id,
  ) {
    return PlaylistSongLoaderProvider(
      id,
    );
  }

  @override
  PlaylistSongLoaderProvider getProviderOverride(
    covariant PlaylistSongLoaderProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'playlistSongLoaderProvider';
}

/// See also [playlistSongLoader].
class PlaylistSongLoaderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [playlistSongLoader].
  PlaylistSongLoaderProvider(
    String id,
  ) : this._internal(
          (ref) => playlistSongLoader(
            ref as PlaylistSongLoaderRef,
            id,
          ),
          from: playlistSongLoaderProvider,
          name: r'playlistSongLoaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playlistSongLoaderHash,
          dependencies: PlaylistSongLoaderFamily._dependencies,
          allTransitiveDependencies:
              PlaylistSongLoaderFamily._allTransitiveDependencies,
          id: id,
        );

  PlaylistSongLoaderProvider._internal(
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
    FutureOr<void> Function(PlaylistSongLoaderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlaylistSongLoaderProvider._internal(
        (ref) => create(ref as PlaylistSongLoaderRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PlaylistSongLoaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistSongLoaderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlaylistSongLoaderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PlaylistSongLoaderProviderElement
    extends AutoDisposeFutureProviderElement<void> with PlaylistSongLoaderRef {
  _PlaylistSongLoaderProviderElement(super.provider);

  @override
  String get id => (origin as PlaylistSongLoaderProvider).id;
}

String _$detailPlaylistSongsStateHash() =>
    r'76e73d7eeff934d53f486a3771904813dc188d97';

/// See also [DetailPlaylistSongsState].
@ProviderFor(DetailPlaylistSongsState)
final detailPlaylistSongsStateProvider = AutoDisposeNotifierProvider<
    DetailPlaylistSongsState, List<SongItemDomain>>.internal(
  DetailPlaylistSongsState.new,
  name: r'detailPlaylistSongsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$detailPlaylistSongsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DetailPlaylistSongsState = AutoDisposeNotifier<List<SongItemDomain>>;
String _$playlistSongsControllerHash() =>
    r'd3881d88fb47dc6929ffa4fc0eba65deb713175e';

/// See also [PlaylistSongsController].
@ProviderFor(PlaylistSongsController)
final playlistSongsControllerProvider =
    AutoDisposeNotifierProvider<PlaylistSongsController, void>.internal(
  PlaylistSongsController.new,
  name: r'playlistSongsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playlistSongsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlaylistSongsController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
