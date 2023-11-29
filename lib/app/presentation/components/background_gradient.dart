import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({Key? key, this.color = AppColors.primaryGradient})
      : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              Container(
                color: color,
              ),
              Container(
                  decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(18, 18, 18, 0),
                      Color.fromRGBO(18, 18, 18, 0.6),
                      Color.fromRGBO(18, 18, 18, 1),
                    ]),
              )),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: AppColors.primaryBackground,
          ),
        )
      ],
    );
  }
}
