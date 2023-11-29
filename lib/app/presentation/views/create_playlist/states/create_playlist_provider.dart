import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/application/create_playlist_service.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';

part 'create_playlist_provider.g.dart';

@riverpod
class SongListCreatePlaylistState extends _$SongListCreatePlaylistState {
  @override
  List<SongItemDomain> build() {
    return [];
  }

  void fetchData() async {
    final list = ref.watch(createPlaylistServicesProvider).songs;
    state = list.toList();
  }
}

@riverpod
class NameCreatePlaylistState extends _$NameCreatePlaylistState {
  @override
  String build() {
    return "";
  }

  void fetchData() async {
    final name = ref.watch(createPlaylistServicesProvider).name;
    state = name;
  }
}

@riverpod
class ColorCreatePlaylistState extends _$ColorCreatePlaylistState {
  @override
  Color build() {
    return Colors.transparent;
  }

  void fetchData() async {
    final color = ref.watch(createPlaylistServicesProvider).color;
    state = color;
  }
}

@riverpod
class ImageCreatePlaylistState extends _$ImageCreatePlaylistState {
  @override
  String build() {
    return "";
  }

  void fetchData() async {
    final image = ref.watch(createPlaylistServicesProvider).hrefPhoto;
    state = image;
  }
}
