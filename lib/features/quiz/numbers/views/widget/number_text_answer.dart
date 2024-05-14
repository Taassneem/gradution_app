import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class TextAnswerNumber extends StatelessWidget {
  const TextAnswerNumber({
    super.key,
    this.number = 'Not a number',
    this.onTap,
    this.question = false,
    this.answerImage = false,
    this.image = 'assets/images/Error.jpg',
  });
  final String number;
  final Function()? onTap;
  final bool question;
  final bool answerImage;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 155.w,
          height: question ? 60.h : 100.h,
          decoration: BoxDecoration(
              color: AppColor.babyBlue,
              borderRadius: BorderRadius.circular(10.w)),
          child: Center(
              child: answerImage
                  ? Image.asset(image)
                  : Text(number,
                      style: Theme.of(context).textTheme.titleMedium)),
        ),
      ),
    );
  }
}
