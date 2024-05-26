import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CustomTimeSelector extends StatefulWidget {
  const CustomTimeSelector({
    super.key,
    required this.time,
    this.isSelected = false,
  });
  final String time;
  final bool isSelected;

  @override
  State<CustomTimeSelector> createState() => _CustomTimeSelectorState();
}

class _CustomTimeSelectorState extends State<CustomTimeSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 80.w,
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.pink, width: 1.5),
            color: widget.isSelected ? AppColor.pink : AppColor.white),
        child: Text(widget.time, style: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }
}
