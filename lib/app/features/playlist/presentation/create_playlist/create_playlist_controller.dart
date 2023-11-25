import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_playlist_controller.g.dart';

@riverpod
Future<void> createPlaylistLoader(CreatePlaylistLoaderRef ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
}
