import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.46.h,
      width: MediaQuery.sizeOf(context).width * 0.8.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
    );
  }
}
