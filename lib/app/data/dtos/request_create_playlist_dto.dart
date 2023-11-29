import 'package:spotify_app/app/application/create_playlist_service.dart';

class RequestCreatePlaylistDto {
  String? name;
  String? autor;
  String? description;
  String? color;
  String? hrefPhoto;
  List<String>? songs;

  RequestCreatePlaylistDto({
    this.name,
    this.autor,
    this.description,
    this.color,
    this.hrefPhoto,
    this.songs,
  });

  factory RequestCreatePlaylistDto.fromDomain(
          CreatePlaylistServices playlist) =>
      RequestCreatePlaylistDto(
        name: playlist.name,
        autor: "Spotify App",
        description: " A playlist created by Spotify App",
        color: playlist.color.toString(),
        hrefPhoto: playlist.hrefPhoto,
        songs: playlist.songs.map((e) => e.id).toList(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "autor": autor,
        "description": description,
        "color": color,
        "hrefPhoto": hrefPhoto,
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x)),
      };
}
