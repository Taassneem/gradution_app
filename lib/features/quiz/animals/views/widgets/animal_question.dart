import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class AnimalQuestion extends StatelessWidget {
  const AnimalQuestion({
    super.key,
    required this.question,
  });
  final String question;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290.w,
      height: MediaQuery.sizeOf(context).height * 0.1.h,
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(20.w)),
      child: Center(
        child: Text(
          question,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
