import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/application/create_playlist_service.dart';
import 'package:spotify_app/app/data/dtos/request_create_playlist_dto.dart';
import 'package:spotify_app/app/data/dtos/response_playlist_dto.dart';
import 'package:spotify_app/app/data/dtos/response_song_search_dto.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';
import 'package:spotify_app/core/network/dio_client.dart';
import 'package:spotify_app/core/utils/dependency_injection.dart';

part 'playlist_repository.g.dart';

abstract class PlaylistRepository {
  Future<List<SongItemDomain>> getSongList(String id);

  Future<bool> likeSong(String id, bool value);

  Future<List<SongItemDomain>> searchSongs(String like);

  Future<bool> createPlaylist(CreatePlaylistServices request);
}

class TruePlaylistRepository implements PlaylistRepository {
  final _dioClient = sl<DioClient>();

  @override
  Future<List<SongItemDomain>> getSongList(String id) async {
    final response = await _dioClient.get(
      path: "/api/playlist/detail/$id",
    );
    return ResponsePlaylistDto.fromJson(response.data).toDomain();
  }

  @override
  Future<bool> likeSong(String id, bool value) async {
    final response = await _dioClient
        .put(path: "/api/song/like/$id", bodyRaw: {"liked": value});
    return response.statusCode == 200;
  }

  @override
  Future<List<SongItemDomain>> searchSongs(String like) async {
    final response = await _dioClient.get(
      path: like.trim() == "" ? "/api/song/list" : "/api/song/list/$like",
    );
    return ResponseSongSearchDto.fromJson({
      "songSearch": response.data,
    }).toDomain();
  }

  @override
  Future<bool> createPlaylist(CreatePlaylistServices request) async {
    final response = await _dioClient.post(
      path: "/api/playlist/create",
      bodyRaw: RequestCreatePlaylistDto.fromDomain(request).toJson(),
    );
    return response.statusCode == 201;
  }
}

@riverpod
PlaylistRepository playlistRepository(PlaylistRepositoryRef ref) {
  return TruePlaylistRepository();
}
