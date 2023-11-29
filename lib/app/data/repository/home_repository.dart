import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/data/dtos/response_playlists_inbox_dto.dart';
import 'package:spotify_app/app/domain/playlist_card_domain.dart';
import 'package:spotify_app/core/network/dio_client.dart';
import 'package:spotify_app/core/utils/dependency_injection.dart';

part 'home_repository.g.dart';

abstract class HomeRepository {
  Future<List<PlaylistCardDomain>> getPlaylistInbox();
}

class FakeHomeRepository implements HomeRepository {
  @override
  Future<List<PlaylistCardDomain>> getPlaylistInbox() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return [];
  }
}

class TrueHomeRepository implements HomeRepository {
  final _dioClient = sl<DioClient>();

  @override
  Future<List<PlaylistCardDomain>> getPlaylistInbox() async {
    final response = await _dioClient.get(
      path: "/api/playlist/list",
    );
    return ResponsePlaylistInboxDto.fromJson({"playlist_inbox": response.data})
        .toDomain();
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return TrueHomeRepository();
}
