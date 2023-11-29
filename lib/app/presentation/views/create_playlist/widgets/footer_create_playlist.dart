import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/app/presentation/components/primary_button.dart';
import 'package:spotify_app/app/presentation/components/secondary_button.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/create_playlist_controller.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class FooterCreatePlaylist extends StatelessWidget {
  const FooterCreatePlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 17.0),
      width: QuerySize.width(context, 1),
      height: 60.0,
      color: AppColors.primaryBackground,
      child: Row(
        children: [
          Expanded(
              child: SecondaryButton(
            label: "Cancelar",
            onTap: () {
              Navigator.pop(context);
            },
          )),
          const SizedBox(
            width: 25.0,
          ),
          Expanded(child: Consumer(
            builder: (context, ref, child) {
              return PrimaryButton(
                label: "Guardar",
                onTap: () {
                  ref
                      .read(createPlaylistControllerProvider.notifier)
                      .createPlaylist(context);
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
