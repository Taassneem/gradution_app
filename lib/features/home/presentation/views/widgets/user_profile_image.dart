import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.w),
            color: AppColor.purple,
            image: const DecorationImage(
              image: AssetImage(AppAssets.model),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 2.h,
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              color: AppColor.purple,
            ),
            child: const Icon(Icons.border_color_outlined),
          ),
        )
      ],
    );
  }
}
