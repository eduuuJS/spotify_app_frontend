import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/app/presentation/views/splash/splash_controller.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class SplashView extends ConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(timerSplashProvider(context));
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child: Image(
          image: const AssetImage(
            "assets/img/logo.png",
          ),
          width: 150.w,
        ),
      ),
    );
  }
}
