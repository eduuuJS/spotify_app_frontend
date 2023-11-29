import 'package:spotify_app/app/domain/playlist_card_domain.dart';

class ResponsePlaylistInboxDto {
  List<PlaylistInbox>? playlistInbox;

  ResponsePlaylistInboxDto({
    this.playlistInbox,
  });

  factory ResponsePlaylistInboxDto.fromJson(Map<String, dynamic> json) =>
      ResponsePlaylistInboxDto(
        playlistInbox: json["playlist_inbox"] == null
            ? []
            : List<PlaylistInbox>.from(
                json["playlist_inbox"]!.map((x) => PlaylistInbox.fromJson(x))),
      );

  List<PlaylistCardDomain> toDomain() {
    return playlistInbox!.map((e) => e.toDomain()).toList();
  }
}

class PlaylistInbox {
  String? id;
  String? name;
  String? autor;
  String? description;
  String? color;
  String? hrefPhoto;

  PlaylistInbox({
    this.id,
    this.name,
    this.autor,
    this.description,
    this.color,
    this.hrefPhoto,
  });

  factory PlaylistInbox.fromJson(Map<String, dynamic> json) => PlaylistInbox(
        id: json["id"],
        name: json["name"],
        autor: json["autor"],
        description: json["description"],
        color: json["color"],
        hrefPhoto: json["hrefPhoto"],
      );

  PlaylistCardDomain toDomain() {
    return PlaylistCardDomain(
      id: id ?? "",
      name: name ?? "",
      autor: autor ?? "",
      color: color ?? "",
      hrefPhoto: hrefPhoto ?? "",
    );
  }
}
