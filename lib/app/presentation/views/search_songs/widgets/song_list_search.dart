import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/app/domain/song_item_domain.dart';
import 'package:spotify_app/app/presentation/components/btn_favorite.dart';
import 'package:spotify_app/app/presentation/views/search_songs/search_songs_controller.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class SongListSearch extends ConsumerWidget {
  const SongListSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songList = ref.watch(songListSearchStateProvider);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = songList[index];
        return ItemSongSearch(
          item: item,
        );
      }, childCount: songList.length),
    );
  }
}

class ItemSongSearch extends StatelessWidget {
  const ItemSongSearch({Key? key, required this.item}) : super(key: key);
  final SongItemDomain item;

  @override
  Widget build(BuildContext context) {
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
          Consumer(builder: (context, ref, _) {
            return GestureDetector(
              onTap: () {
                final response = ref
                    .read(songListSearchStateProvider.notifier)
                    .addSong(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(response
                        ? "Agregado correctamente"
                        : "Esta canción ya existe en la lista"),
                    duration: const Duration(milliseconds: 300),
                    backgroundColor:
                        response ? AppColors.primaryColor : AppColors.redError,
                  ),
                );
              },
              child: const Icon(
                Iconsax.add_circle5,
                color: Colors.white,
              ),
            );
          })
        ],
      ),
    );
  }
}
