import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
    required this.image,
  });
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 130.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.w),
            color: AppColor.purple,
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -10.h,
          child: Container(
            width: 40.w,
            height: 40.h,
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
