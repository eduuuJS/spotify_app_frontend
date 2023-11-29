import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BtnBack extends StatelessWidget {
  const BtnBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const CircleAvatar(
            radius: 22.0,
            backgroundColor: Color.fromRGBO(40, 40, 40, 0.562),
            child: Icon(
              Iconsax.arrow_left,
              color: Colors.white,
              size: 18.0,
            )),
      ),
    );
  }
}
