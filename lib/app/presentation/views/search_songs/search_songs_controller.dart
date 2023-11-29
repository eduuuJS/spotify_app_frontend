import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/data/repository/playlist_repository.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/create_playlist_controller.dart';

part 'search_songs_controller.g.dart';

@riverpod
Future<void> searchSongsLoader(SearchSongsLoaderRef ref) async {
  await Future.delayed(Duration.zero);
  await ref.watch(songListSearchStateProvider.notifier).search("");
}

@riverpod
class SongListSearchState extends _$SongListSearchState {
  @override
  List<SongItemDomain> build() {
    return [];
  }

  Future<void> search(String like) async {
    final list = await ref.watch(playlistRepositoryProvider).searchSongs(like);
    state = list;
  }

  bool addSong(SongItemDomain song) {
    final response =
        ref.watch(createPlaylistControllerProvider.notifier).addSong(song);
    return response;
  }
}
