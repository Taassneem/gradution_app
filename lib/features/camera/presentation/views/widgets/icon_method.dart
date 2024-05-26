import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class IconMethod extends StatelessWidget {
  const IconMethod({
    super.key,
    this.icon,
    this.onTap,
    this.rightIcon = false,
  });
  final IconData? icon;
  final void Function()? onTap;
  final bool? rightIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50.h,
          width: MediaQuery.sizeOf(context).width * 0.4.w,
          decoration: BoxDecoration(
            color: AppColor.purple,
            borderRadius: rightIcon == true
                ? const BorderRadius.only(bottomRight: Radius.circular(30))
                : const BorderRadius.only(bottomLeft: Radius.circular(30)),
          ),
          child: Icon(icon),
        ));
  }
}
