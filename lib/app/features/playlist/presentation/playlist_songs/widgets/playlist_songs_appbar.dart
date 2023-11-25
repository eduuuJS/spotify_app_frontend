import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class PlaylistSongsAppBar extends ConsumerWidget {
  const PlaylistSongsAppBar({Key? key, required this.imageSize})
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
                      "https://i.scdn.co/image/ab67706c0000da84d1f42ce7c4fd755015a6d129",
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
                  const Text(
                    "EDM Hits",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  const Text(
                    "Warner Chappell Music",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300),
                  ),
                  const Spacer(),
                  if (imageSize == _maxImageSize)
                    const Icon(
                      Icons.play_circle_fill_rounded,
                      color: AppColors.primaryColor,
                      size: 40.0,
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

class PlaylistSongsAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExent;
    final currentImageSize = (_maxImageSize * (1 - percent)).clamp(
      _minImageSize,
      _maxImageSize,
    );
    return PlaylistSongsAppBar(
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
