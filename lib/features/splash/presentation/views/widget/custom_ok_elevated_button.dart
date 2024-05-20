import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CustomOkElevatedButton extends StatelessWidget {
  const CustomOkElevatedButton({
    super.key,
    this.onPressed,
    this.isPurple = false,
    required this.text,
  });
  final void Function()? onPressed;
  final bool isPurple;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: isPurple ? AppColor.purple : AppColor.white,
            padding: EdgeInsets.symmetric(
                vertical: 15.h, horizontal: isArabic() ? 70.w : 60.w)),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
