class SongItemDomain {
  String id;
  String name;
  String artist;
  String hrefPhoto;
  String color;
  String hrefSound;
  bool liked;

  SongItemDomain({
    required this.id,
    required this.name,
    required this.artist,
    required this.hrefPhoto,
    required this.color,
    required this.hrefSound,
    required this.liked,
  });

  SongItemDomain likeSong(String idReceipt, bool value) {
    return SongItemDomain(
      id: id,
      name: name,
      artist: artist,
      hrefPhoto: hrefPhoto,
      color: color,
      hrefSound: hrefSound,
      liked: idReceipt == id ? value : liked,
    );
  }
}
