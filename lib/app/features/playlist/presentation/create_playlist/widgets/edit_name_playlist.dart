import 'package:flutter/material.dart';
import 'package:spotify_app/app/shared/presentation/components/primary_button.dart';
import 'package:spotify_app/app/shared/presentation/components/secondary_button.dart';

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
            Expanded(
                child: PrimaryButton(
              label: "Guardar",
              onTap: () {
                Navigator.pop(context, ctrlNamePlaylist.text);
              },
            )),
          ],
        )
      ],
    );
  }
}
