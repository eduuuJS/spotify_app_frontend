import 'package:spotify_app/app/domain/song_item_domain.dart';

class ResponsePlaylistDto {
  String? id;
  String? name;
  String? autor;
  String? description;
  String? color;
  String? hrefPhoto;
  List<Song>? songs;

  ResponsePlaylistDto({
    this.id,
    this.name,
    this.autor,
    this.description,
    this.color,
    this.hrefPhoto,
    this.songs,
  });

  factory ResponsePlaylistDto.fromJson(Map<String, dynamic> json) =>
      ResponsePlaylistDto(
        id: json["id"],
        name: json["name"],
        autor: json["autor"],
        description: json["description"],
        color: json["color"],
        hrefPhoto: json["hrefPhoto"],
        songs: json["songs"] == null
            ? []
            : List<Song>.from(json["songs"]!.map((x) => Song.fromJson(x))),
      );

  List<SongItemDomain> toDomain() {
    return songs!.map((e) => e.toDomain()).toList();
  }
}

class Song {
  String? id;
  String? name;
  String? artist;
  String? hrefPhoto;
  String? color;
  String? hrefSound;
  bool? liked;

  Song({
    this.id,
    this.name,
    this.artist,
    this.hrefPhoto,
    this.color,
    this.hrefSound,
    this.liked,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        name: json["name"],
        artist: json["artist"],
        hrefPhoto: json["hrefPhoto"],
        color: json["color"],
        hrefSound: json["hrefSound"],
        liked: json["liked"],
      );

  SongItemDomain toDomain() {
    return SongItemDomain(
      id: id ?? "",
      name: name ?? "",
      artist: artist ?? "",
      hrefPhoto: hrefPhoto ?? "",
      color: color ?? "",
      hrefSound: hrefSound ?? "",
      liked: liked ?? false,
    );
  }
}
