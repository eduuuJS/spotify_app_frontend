import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class SongList extends ConsumerWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return const ItemSong();
      }, childCount: 28),
    );
  }
}

class ItemSong extends StatelessWidget {
  const ItemSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 45.0,
            height: 45.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.scdn.co/image/ab67616d0000b2732b517912fd69652ff10d8e11"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Runaway ( U & I )",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 1.0,
                ),
                AutoSizeText(
                  "Galantis",
                  style: TextStyle(
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
          const Icon(
            Iconsax.heart5,
            color: AppColors.primaryColor,
            size: 20.0,
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
    );
  }
}
