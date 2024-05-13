import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 9.0.r),
          child: SizedBox(
            width: width.w,
            height: height.h,
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(10.w)),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 9.0.r),
          child: SizedBox(
            width: width.w,
            height: height.h,
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(10.w)),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 9.0.r),
          child: SizedBox(
            width: width.w,
            height: height.h,
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(10.w)),
                )),
          ),
        )
      ],
    );
  }
}
