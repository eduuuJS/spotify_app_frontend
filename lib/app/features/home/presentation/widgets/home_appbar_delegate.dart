import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/core/routes/app_router.dart';

class HomeAppbar extends ConsumerWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 45, bottom: 10),
      child: Row(
        children: [
          const Text(
            "Mis Playlists",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.push(AppRoutesNamed.createPlaylistRoute);
            },
            child: const Icon(
              Iconsax.add_circle,
              color: Colors.white,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
