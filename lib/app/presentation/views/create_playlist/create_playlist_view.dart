import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/app/presentation/components/background_gradient.dart';
import 'package:spotify_app/app/presentation/components/btn_back.dart';
import 'package:spotify_app/app/presentation/components/loading_widget.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/create_playlist_controller.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/states/create_playlist_provider.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/widgets/create_playlist_appbar.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/widgets/empty_list_songs.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/widgets/footer_create_playlist.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/widgets/song_list_create_playlist.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class CreatePlaylistView extends ConsumerWidget {
  const CreatePlaylistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final isLoading = ref.watch(createPlaylistLoaderProvider(context));
    final listSongs = ref.watch(songListCreatePlaylistStateProvider);

    //Elements
    Widget data = CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: CreatePlaylistAppBarDelegate(),
          pinned: true,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20.0),
        ),
        if (listSongs.isNotEmpty) const SongListCreatePlaylist(),
        if (listSongs.isEmpty) const EmptyListSongs()
      ],
    );
    Widget loading = const Column(
      children: [
        Spacer(),
        Center(child: LoadingWidget()),
        Spacer(),
      ],
    );

    return Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SafeArea(
          child: Stack(
            children: [
              Consumer(builder: (context, ref, child) {
                final color = ref.watch(colorCreatePlaylistStateProvider);
                return BackgroundGradient(color: color);
              }),
              SizedBox(
                height: QuerySize.height(context, 1),
                child: isLoading.when(
                    data: (_) => data,
                    error: (_, __) => null,
                    loading: () => loading),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            listSongs.isNotEmpty ? const FooterCreatePlaylist() : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: const BtnBack());
  }
}
