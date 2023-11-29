import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/app/domain/playlist_card_domain.dart';
import 'package:spotify_app/app/presentation/components/background_gradient.dart';
import 'package:spotify_app/app/presentation/components/custom_navigation_bar.dart';
import 'package:spotify_app/app/presentation/components/loading_widget.dart';
import 'package:spotify_app/app/presentation/views/playlist_songs/playlist_songs_controller.dart';
import 'package:spotify_app/app/presentation/views/playlist_songs/widgets/playlist_songs_appbar.dart';
import 'package:spotify_app/app/presentation/views/playlist_songs/widgets/song_list.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/helpers.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class PlaylistSongsView extends ConsumerWidget {
  const PlaylistSongsView({Key? key, required this.playlistData})
      : super(key: key);
  final PlaylistCardDomain playlistData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final isLoading = ref.watch(playlistSongLoaderProvider(playlistData.id));

    //Elements
    Widget data = CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: PlaylistSongsAppBarDelegate(playlistData: playlistData),
          pinned: true,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20.0),
        ),
        const SongList(),
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
              BackgroundGradient(color: Helpers.getColor(playlistData.color)),
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
        bottomNavigationBar: const CustomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 3.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
                radius: 22.0,
                backgroundColor: Color.fromRGBO(40, 40, 40, 0.562),
                child: Icon(
                  Iconsax.arrow_left,
                  color: Colors.white,
                  size: 18.0,
                )),
          ),
        ));
  }
}
