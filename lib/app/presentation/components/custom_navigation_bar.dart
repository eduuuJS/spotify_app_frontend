import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotify_app/core/theme/app_colors.dart';
import 'package:spotify_app/core/utils/query_size.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: QuerySize.width(context, 1),
      height: 65.0,
      color: AppColors.grayBar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _itemNavigationBar(
              title: "Home", icon: Iconsax.home5, isSelected: true),
          _itemNavigationBar(
              title: "Search", icon: Iconsax.search_normal, isSelected: false),
          _itemNavigationBar(
              title: "Your Library",
              icon: Iconsax.music_library_2,
              isSelected: false)
        ],
      ),
    );
  }

  Widget _itemNavigationBar(
      {required String title,
      required IconData icon,
      required bool isSelected}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? AppColors.primaryColor : Colors.white,
          size: 20.0,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          title,
          style: TextStyle(
              color: isSelected ? AppColors.primaryColor : Colors.white,
              fontSize: 13.0,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
