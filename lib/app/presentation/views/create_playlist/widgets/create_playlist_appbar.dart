import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/states/create_playlist_provider.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/widgets/edit_name_playlist.dart';
import 'package:spotify_app/core/routes/app_router.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/helpers.dart';

class CreatePlaylistAppBar extends StatelessWidget {
  const CreatePlaylistAppBar({Key? key, required this.imageSize})
      : super(key: key);
  final double imageSize;

  @override
  Widget build(BuildContext context) {
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
            Consumer(
              builder: (context, ref, _) {
                final imagePlaylist =
                    ref.watch(imageCreatePlaylistStateProvider);
                return Container(
                  height: imageSize,
                  width: imageSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          imagePlaylist,
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
                );
              },
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, _) {
                      final namePlaylist =
                          ref.watch(nameCreatePlaylistStateProvider);
                      return Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              namePlaylist,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              final namePlaylist =
                                  ref.read(nameCreatePlaylistStateProvider);
                              showModalEditNamePlaylist(context, namePlaylist);
                            },
                            child: const Icon(Iconsax.edit_2,
                                color: Colors.white, size: 20.0),
                          )
                        ],
                      );
                    },
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

  void showModalEditNamePlaylist(BuildContext context, String namePlaylist) {
    Helpers.getShowModalBS(context,
        content: EditNamePlaylist(
          initialValue: namePlaylist,
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
