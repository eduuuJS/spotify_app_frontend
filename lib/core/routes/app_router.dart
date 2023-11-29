import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/create_playlist_view.dart';
import 'package:spotify_app/app/presentation/views/home/home_view.dart';
import 'package:spotify_app/app/presentation/views/playlist_songs/playlist_songs_view.dart';
import 'package:spotify_app/app/presentation/views/search_songs/search_songs_view.dart';
import 'package:spotify_app/app/presentation/views/splash/splash_view.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutesNamed.splashRoute,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutesNamed.homeRoute,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRoutesNamed.playlistRoute,
      builder: (context, state) {
        final params = state.extra as Map;
        return PlaylistSongsView(
          playlistData: params["data"],
        );
      },
    ),
    GoRoute(
      path: AppRoutesNamed.createPlaylistRoute,
      builder: (context, state) => const CreatePlaylistView(),
    ),
    GoRoute(
      path: AppRoutesNamed.songSearchRoute,
      builder: (context, state) => const SearchSongsView(),
    ),
  ]);
}

class AppRoutesNamed {
  static const splashRoute = "/splash";
  static const homeRoute = "/home";
  static const playlistRoute = "/playlist";
  static const namePlaylistRoute = "/namePlaylistRoute";
  static const createPlaylistRoute = "/createPlaylistRoute";
  static const songSearchRoute = "/songSearchRoute";
}
