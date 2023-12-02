import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';
import 'package:spotify_app/app/presentation/components/btn_favorite.dart';
import 'package:spotify_app/app/presentation/views/playlist_songs/playlist_songs_controller.dart';

class SongList extends ConsumerWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSong = ref.watch(detailPlaylistSongsStateProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = listSong[index];
        return ItemSong(item: item);
      }, childCount: listSong.length),
    );
  }
}

class ItemSong extends ConsumerWidget {
  const ItemSong({Key? key, required this.item}) : super(key: key);
  final SongItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
          BtnFavorite(value: item.liked, idSong: item.id),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.more_vert_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
