import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_songs_controller.g.dart';

@riverpod
Future<void> searchSongsLoader(SearchSongsLoaderRef ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
}
