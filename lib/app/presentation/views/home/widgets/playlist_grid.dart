import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/app/domain/playlist_card_domain.dart';
import 'package:spotify_app/app/presentation/views/home/home_controller.dart';
import 'package:spotify_app/core/routes/app_router.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class PlaylistGrid extends ConsumerWidget {
  const PlaylistGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPlaylist = ref.watch(listPlaylistHomeStateProvider);

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 25.0, crossAxisCount: 2, childAspectRatio: 0.85),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final item = listPlaylist[index];
        return PlaylistCardItem(item: item);
      }, childCount: listPlaylist.length),
    );
  }
}

class PlaylistCardItem extends StatelessWidget {
  const PlaylistCardItem({Key? key, required this.item}) : super(key: key);
  final PlaylistCardDomain item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.push(AppRoutesNamed.playlistRoute, extra: {
                "data": item,
              });
            },
            child: Container(
              width: (QuerySize.width(context, 1) - 30) / 2,
              height: (QuerySize.width(context, 1) - 30) / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(item.hrefPhoto), fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
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
          Text(
            item.autor,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
