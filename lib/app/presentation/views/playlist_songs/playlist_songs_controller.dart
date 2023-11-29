import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/data/repository/playlist_repository.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';

part 'playlist_songs_controller.g.dart';

@riverpod
Future<void> playlistSongLoader(PlaylistSongLoaderRef ref, String id) async {
  await Future.delayed(Duration.zero);
  await ref.watch(detailPlaylistSongsStateProvider.notifier).fetchData(id);
}

@riverpod
class DetailPlaylistSongsState extends _$DetailPlaylistSongsState {
  @override
  List<SongItemDomain> build() {
    return [];
  }

  Future<void> fetchData(String id) async {
    final list = await ref.watch(playlistRepositoryProvider).getSongList(id);
    state = list;
  }

  void likeSong(String id, bool value) {
    state = state.map((e) => e.likeSong(id, value)).toList();
  }
}

@riverpod
class PlaylistSongsController extends _$PlaylistSongsController {
  @override
  void build() {
    return;
  }

  Future<void> likeSong(String id, bool value) async {
    ref.watch(playlistRepositoryProvider).likeSong(id, value);
    ref.watch(detailPlaylistSongsStateProvider.notifier).likeSong(id, value);
  }
}
