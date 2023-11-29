import 'package:spotify_app/app/domain/song_item_domain.dart';

class ResponseSongSearchDto {
  List<SongSearch>? songSearch;

  ResponseSongSearchDto({
    this.songSearch,
  });

  factory ResponseSongSearchDto.fromJson(Map<String, dynamic> json) =>
      ResponseSongSearchDto(
        songSearch: json["songSearch"] == null
            ? []
            : List<SongSearch>.from(
                json["songSearch"]!.map((x) => SongSearch.fromJson(x))),
      );

  List<SongItemDomain> toDomain() {
    return songSearch!.map((e) => e.toDomain()).toList();
  }
}

class SongSearch {
  String? id;
  String? name;
  String? artist;
  String? hrefPhoto;
  String? color;
  String? hrefSound;
  bool? liked;

  SongSearch({
    this.id,
    this.name,
    this.artist,
    this.hrefPhoto,
    this.color,
    this.hrefSound,
    this.liked,
  });

  factory SongSearch.fromJson(Map<String, dynamic> json) => SongSearch(
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
