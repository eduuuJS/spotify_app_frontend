import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/helpers.dart';

part 'create_playlist_service.g.dart';

class CreatePlaylistServices {
  String defaultImage =
      "https://play-lh.googleusercontent.com/cShys-AmJ93dB0SV8kE6Fl5eSaf4-qMMZdwEDKI5VEmKAXfzOqbiaeAsqqrEBCTdIEs=w240-h480-rw";
  Color defaultColor = AppColors.primaryColor;

  late String name;
  late String autor;
  late Color color;
  late String hrefPhoto;
  late List<SongItemDomain> songs;

  void initialize() {
    name = "New Playlist";
    autor = "My User";
    color = defaultColor;
    hrefPhoto = defaultImage;
    songs = [];
  }

  bool addSong(SongItemDomain song) {
    if (songs.any((element) => element.id == song.id)) {
      return false;
    }
    songs.add(song);
    _updateValues();
    return true;
  }

  void removeSong(String id) {
    songs.removeWhere((element) => element.id == id);
    _updateValues();
  }

  _updateValues() {
    if (songs.isNotEmpty) {
      color = Helpers.getColor(songs.first.color);
      hrefPhoto = songs.first.hrefPhoto;
    } else {
      color = defaultColor;
      hrefPhoto = defaultImage;
    }
  }
}

@riverpod
CreatePlaylistServices createPlaylistServices(CreatePlaylistServicesRef ref) {
  return CreatePlaylistServices();
}
