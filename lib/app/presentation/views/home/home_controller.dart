import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/data/repository/home_repository.dart';
import 'package:spotify_app/app/domain/playlist_card_domain.dart';

part 'home_controller.g.dart';

@riverpod
Future<void> homeLoader(HomeLoaderRef ref) async {
  await Future.delayed(Duration.zero);
  await ref.watch(listPlaylistHomeStateProvider.notifier).fetchData();
}

@riverpod
class ListPlaylistHomeState extends _$ListPlaylistHomeState {
  @override
  List<PlaylistCardDomain> build() {
    return [];
  }

  Future<void> fetchData() async {
    final list = await ref.watch(homeRepositoryProvider).getPlaylistInbox();
    state = list;
  }
}
