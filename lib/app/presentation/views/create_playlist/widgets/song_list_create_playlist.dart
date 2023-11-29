import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/create_playlist_controller.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/states/create_playlist_provider.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class SongListCreatePlaylist extends ConsumerWidget {
  const SongListCreatePlaylist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSong = ref.watch(songListCreatePlaylistStateProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = listSong[index];
        return ItemSongCreatePlaylist(item: item);
      }, childCount: listSong.length),
    );
  }
}

class ItemSongCreatePlaylist extends ConsumerWidget {
  const ItemSongCreatePlaylist({Key? key, required this.item})
      : super(key: key);
  final SongItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        ref.read(createPlaylistControllerProvider.notifier).removeSong(item.id);
      },
      background: Container(
        color: AppColors.redError,
        child: const Row(
          children: [
            Spacer(),
            Icon(
              Iconsax.trash,
              color: Colors.white,
            ),
            SizedBox(width: 10.0)
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(item.hrefPhoto), fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    item.name,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  AutoSizeText(
                    item.artist,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Icon(
                item.liked ? Iconsax.heart5 : Iconsax.heart,
                color: item.liked ? AppColors.primaryColor : Colors.white,
                size: 20.0,
              ),
              onTap: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
