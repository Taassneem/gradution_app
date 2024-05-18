import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:shimmer/shimmer.dart';

class CustomTextShimmer extends StatelessWidget {
  const CustomTextShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),
        SizedBox(
          width: 172.w,
          height: 12.h,
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.circular(10.w)),
              )),
        ),
      ],
    );
  }
}
