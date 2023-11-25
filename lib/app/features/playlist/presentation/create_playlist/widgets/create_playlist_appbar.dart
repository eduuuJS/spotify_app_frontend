import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/app/features/playlist/presentation/create_playlist/widgets/edit_name_playlist.dart';
import 'package:spotify_app/core/routes/app_router.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/helpers.dart';

class CreatePlaylistAppBar extends ConsumerWidget {
  const CreatePlaylistAppBar({Key? key, required this.imageSize})
      : super(key: key);
  final double imageSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: EdgeInsets.only(
            top: 15.0,
            left: imageSize == _minImageSize ? 80.0 : 15.0,
            right: 15.0,
            bottom: 15.0),
        decoration: BoxDecoration(
          color: imageSize == _minImageSize
              ? AppColors.primaryBackground
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              height: imageSize,
              width: imageSize,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://play-lh.googleusercontent.com/cShys-AmJ93dB0SV8kE6Fl5eSaf4-qMMZdwEDKI5VEmKAXfzOqbiaeAsqqrEBCTdIEs=w240-h480-rw",
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 27,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        color: AppColors.primaryBackground)
                  ]),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const Text(
                        "New Playlist",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Helpers.getShowModalBS(context,
                              content: const EditNamePlaylist(
                                initialValue: "New Playlist",
                              ));
                        },
                        child: const Icon(Iconsax.edit_2,
                            color: Colors.white, size: 20.0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  const Text(
                    "Spotify",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300),
                  ),
                  const Spacer(),
                  if (imageSize == _maxImageSize)
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutesNamed.songSearchRoute);
                      },
                      child: const Icon(
                        Iconsax.add_circle5,
                        color: AppColors.primaryColor,
                        size: 40.0,
                      ),
                    )
                ],
              ),
            ),
          ],
        ));
  }
}

const _maxImageSize = 160.0;
const _minImageSize = 80.0;

const _maxHeaderExent = 180.0;
const _minHeaderExent = 100.0;

class CreatePlaylistAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExent;
    final currentImageSize = (_maxImageSize * (1 - percent)).clamp(
      _minImageSize,
      _maxImageSize,
    );
    return CreatePlaylistAppBar(
      imageSize: currentImageSize,
    );
  }

  @override
  double get maxExtent => _maxHeaderExent;

  @override
  double get minExtent => _minHeaderExent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
