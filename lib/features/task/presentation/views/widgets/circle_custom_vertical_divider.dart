import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CircleWithCustomVerticalDivider extends StatelessWidget {
  const CircleWithCustomVerticalDivider({
    super.key,
    this.isFinalTask = false,
  });
  final bool isFinalTask;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        CircleAvatar(
          backgroundColor: AppColor.pink,
          radius: 10.r,
        ),
        SizedBox(height: 16.h),
        isFinalTask
            ? const SizedBox.shrink()
            : Container(
                width: 2.w,
                height: 88.h,
                decoration: const BoxDecoration(
                  color: AppColor.pink,
                ),
              ),
      ],
    );
  }
}
