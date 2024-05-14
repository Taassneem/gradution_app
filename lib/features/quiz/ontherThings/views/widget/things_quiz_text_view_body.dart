import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'things_text_answer.dart';

class ThingsQuizTextViewBody extends StatelessWidget {
  const ThingsQuizTextViewBody({
    super.key,
    required this.question,
    required this.answerOne,
    required this.answerTwo,
    required this.answerThree,
    required this.answerFour,
    this.onTapOne,
    this.onTapTwo,
    this.onTapThree,
    this.onTapFour,
  });
  final String question;
  final String answerOne;
  final String answerTwo;
  final String answerThree;
  final String answerFour;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Function()? onTapThree;
  final Function()? onTapFour;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.thingsBack))),
      child: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColor.babyBlue,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.volume_up_outlined)),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 233.w,
                    height: 187.h,
                    color: AppColor.babyBlue,
                    child: Image.asset(question)),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.13.h),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(18.r),
              decoration: BoxDecoration(
                  color: AppColor.babyBlue,
                  borderRadius: BorderRadius.circular(20.w)),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThingsTextAnswer(answer: answerOne, onTap: onTapOne),
                      ThingsTextAnswer(answer: answerTwo, onTap: onTapTwo)
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThingsTextAnswer(answer: answerThree, onTap: onTapThree),
                      ThingsTextAnswer(answer: answerFour, onTap: onTapFour)
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
