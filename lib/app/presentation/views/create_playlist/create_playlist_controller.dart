// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/application/create_playlist_service.dart';
import 'package:spotify_app/app/data/repository/playlist_repository.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';
import 'package:spotify_app/app/presentation/components/spinner.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/states/create_playlist_provider.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/widgets/edit_name_playlist.dart';
import 'package:spotify_app/app/presentation/views/home/home_controller.dart';
import 'package:spotify_app/core/routes/app_router.dart';
import 'package:spotify_app/core/utils/helpers.dart';

part 'create_playlist_controller.g.dart';

@riverpod
Future<void> createPlaylistLoader(
    CreatePlaylistLoaderRef ref, BuildContext context) async {
  await Future.delayed(Duration.zero);
  Future.delayed(Duration.zero, (() {
    showModalEditNamePlaylist(context, "New Playlist");
  }));
  ref.watch(createPlaylistServicesProvider).initialize();
  ref.watch(createPlaylistControllerProvider.notifier).updateScreen();
  return;
}

@riverpod
class CreatePlaylistController extends _$CreatePlaylistController {
  @override
  void build() {
    return;
  }

  void updateScreen() {
    ref.watch(songListCreatePlaylistStateProvider.notifier).fetchData();
    ref.watch(nameCreatePlaylistStateProvider.notifier).fetchData();
    ref.watch(colorCreatePlaylistStateProvider.notifier).fetchData();
    ref.watch(imageCreatePlaylistStateProvider.notifier).fetchData();
  }

  void changeName(String name) {
    ref.watch(createPlaylistServicesProvider).changeName(name);
    ref.watch(nameCreatePlaylistStateProvider.notifier).fetchData();
  }

  bool addSong(SongItemDomain song) {
    final response = ref.watch(createPlaylistServicesProvider).addSong(song);
    if (response) {
      updateScreen();
    }
    return response;
  }

  void removeSong(String id) {
    ref.watch(createPlaylistServicesProvider).removeSong(id);
    updateScreen();
  }

  Future<void> createPlaylist(BuildContext context) async {
    ref.watch(spinnerStateProvider.notifier).show();
    final request = ref.watch(createPlaylistServicesProvider);
    try {
      final response =
          await ref.watch(playlistRepositoryProvider).createPlaylist(request);
      if (response) {
        await ref.watch(listPlaylistHomeStateProvider.notifier).fetchData();
        ref.watch(spinnerStateProvider.notifier).hide();
        context.go(AppRoutesNamed.homeRoute);
      }
    } catch (e) {
      ref.watch(spinnerStateProvider.notifier).hide();
    }
  }
}

void showModalEditNamePlaylist(BuildContext context, String namePlaylist) {
  Helpers.getShowModalBS(context,
      content: EditNamePlaylist(
        initialValue: namePlaylist,
      ));
}
