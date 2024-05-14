// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gradution_app/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.isTaskView = false,
  });
  final bool isTaskView;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      height: 1.h,
      color: isTaskView ? AppColor.divider : AppColor.white,
    );
  }
}
