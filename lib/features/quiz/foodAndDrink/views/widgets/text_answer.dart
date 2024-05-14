import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class TextAnswer extends StatelessWidget {
  const TextAnswer({
    super.key,
    this.onTap,
    required this.answer,
  });
  final Function()? onTap;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200.h,
        width: 155.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Center(
            child: Text(
          answer,
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }
}
