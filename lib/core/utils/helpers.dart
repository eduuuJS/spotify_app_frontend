import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

abstract class Helpers {
  static Future<void> getShowModalBS(
    BuildContext context, {
    required Widget content,
    bool isDismissible = true,
    bool isScrollControlled = false,
  }) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: isScrollControlled,
      context: context,
      elevation: 0.0,
      isDismissible: isDismissible,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50.w,
                  height: 10.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 15.0,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      content,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
