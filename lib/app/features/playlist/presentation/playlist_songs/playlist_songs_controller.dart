import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playlist_songs_controller.g.dart';

@riverpod
Future<void> playlistSongLoader(PlaylistSongLoaderRef ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
}
