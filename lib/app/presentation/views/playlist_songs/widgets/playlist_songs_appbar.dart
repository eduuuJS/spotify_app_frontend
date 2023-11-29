import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/app/domain/playlist_card_domain.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class PlaylistSongsAppBar extends ConsumerWidget {
  const PlaylistSongsAppBar(
      {Key? key, required this.imageSize, required this.playlistData})
      : super(key: key);
  final double imageSize;
  final PlaylistCardDomain playlistData;

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
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      playlistData.hrefPhoto,
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
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
                  Text(
                    playlistData.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  Text(
                    playlistData.autor,
                    style: const TextStyle(
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
  PlaylistCardDomain playlistData;

  PlaylistSongsAppBarDelegate({required this.playlistData});

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
      playlistData: playlistData,
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
