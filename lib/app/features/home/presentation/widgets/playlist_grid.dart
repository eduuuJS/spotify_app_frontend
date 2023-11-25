import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/core/routes/app_router.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class PlaylistGrid extends ConsumerWidget {
  const PlaylistGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 25.0, crossAxisCount: 2, childAspectRatio: 0.85),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.push(AppRoutesNamed.playlistRoute);
                },
                child: Container(
                  width: (QuerySize.width(context, 1) - 30) / 2,
                  height: (QuerySize.width(context, 1) - 30) / 2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.scdn.co/image/ab67616d0000b2738aa25daf45301942884d9beb"),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const AutoSizeText(
                "A State of Trance",
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 1.0,
              ),
              const Text(
                "Armin Van Buuren",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        );
      }, childCount: 14

          /// Set childCount to limit no.of items
          /// childCount: 100,
          ),
    );
  }
}
