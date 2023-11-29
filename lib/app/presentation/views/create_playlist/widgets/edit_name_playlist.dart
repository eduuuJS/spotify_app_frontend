import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_app/app/presentation/components/primary_button.dart';
import 'package:spotify_app/app/presentation/components/secondary_button.dart';
import 'package:spotify_app/app/presentation/views/create_playlist/create_playlist_controller.dart';

class EditNamePlaylist extends StatelessWidget {
  const EditNamePlaylist({Key? key, required this.initialValue})
      : super(key: key);
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    final ctrlNamePlaylist = TextEditingController(text: initialValue);

    return Column(
      children: [
        TextField(
          controller: ctrlNamePlaylist,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 7.0),
              labelText: "Nombre de la playlist",
              labelStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
          autofocus: true,
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        const SizedBox(
          height: 25.0,
        ),
        Row(
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
            Expanded(child: Consumer(builder: (context, ref, _) {
              return PrimaryButton(
                label: "Guardar",
                onTap: () {
                  ref
                      .read(createPlaylistControllerProvider.notifier)
                      .changeName(ctrlNamePlaylist.text);
                  Navigator.pop(context, ctrlNamePlaylist.text);
                },
              );
            })),
          ],
        )
      ],
    );
  }
}
