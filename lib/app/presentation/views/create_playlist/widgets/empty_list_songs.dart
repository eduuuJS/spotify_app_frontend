import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/app/presentation/components/primary_button.dart';
import 'package:spotify_app/core/routes/app_router.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class EmptyListSongs extends StatelessWidget {
  const EmptyListSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: QuerySize.height(context, 0.6),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "Empezemos a expandir tu playlist",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85.0),
                child: Row(children: [
                  Expanded(
                      child: PrimaryButton(
                    label: "Agregar a esta playlists",
                    onTap: () {
                      context.push(AppRoutesNamed.songSearchRoute);
                    },
                  )),
                ]),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
