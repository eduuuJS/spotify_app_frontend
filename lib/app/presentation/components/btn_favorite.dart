import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/app/data/repository/playlist_repository.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class BtnFavorite extends ConsumerStatefulWidget {
  const BtnFavorite({Key? key, required this.value, required this.idSong})
      : super(key: key);
  final bool value;
  final String idSong;

  @override
  BtnFavoriteState createState() => BtnFavoriteState();
}

class BtnFavoriteState extends ConsumerState<BtnFavorite> {
  bool value = false;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        value ? Iconsax.heart5 : Iconsax.heart,
        color: value ? AppColors.primaryColor : Colors.white,
        size: 20.0,
      ),
      onTap: () {
        setState(() {
          value = !value;
        });
        ref.watch(playlistRepositoryProvider).likeSong(widget.idSong, value);
      },
    );
  }
}
