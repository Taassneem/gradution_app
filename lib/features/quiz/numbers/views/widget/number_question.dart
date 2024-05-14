import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class NumberQuestion extends StatelessWidget {
  const NumberQuestion({
    super.key,
    required this.question,
  });
  final String question;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      height: 90.h,
      decoration: BoxDecoration(
          color: AppColor.babyBlue, borderRadius: BorderRadius.circular(10.w)),
      child: Center(
        child: Text(question, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
