import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/app/features/playlist/presentation/create_playlist/create_playlist_controller.dart';
import 'package:spotify_app/app/features/playlist/presentation/create_playlist/widgets/create_playlist_appbar.dart';
import 'package:spotify_app/app/features/playlist/presentation/create_playlist/widgets/footer_create_playlist.dart';
import 'package:spotify_app/app/features/playlist/presentation/create_playlist/widgets/song_list_create_playlist.dart';
import 'package:spotify_app/app/shared/presentation/components/background_gradient.dart';
import 'package:spotify_app/app/shared/presentation/components/loading_widget.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class CreatePlaylistView extends ConsumerWidget {
  const CreatePlaylistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Providers
    final isLoading = ref.watch(createPlaylistLoaderProvider);

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
        const SongListCreatePlaylist(),
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
              const BackgroundGradient(color: AppColors.primaryColor),
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
        bottomNavigationBar: const FooterCreatePlaylist(),
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
