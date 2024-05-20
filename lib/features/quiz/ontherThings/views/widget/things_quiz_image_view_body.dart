import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';

import 'things_image_answer.dart';

class ThingsQuizImageViewBody extends StatelessWidget {
  const ThingsQuizImageViewBody({
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
            const BackToHome(),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 170.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                        color: AppColor.babyBlue,
                        borderRadius: BorderRadius.circular(20.w)),
                    child: Center(
                        child: Text(
                      question,
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08.h),
            Container(
              width: MediaQuery.sizeOf(context).width.w,
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
                      ThingsImageAnswer(image: answerOne, onTap: onTapOne),
                      ThingsImageAnswer(image: answerTwo, onTap: onTapTwo)
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThingsImageAnswer(image: answerThree, onTap: onTapThree),
                      ThingsImageAnswer(image: answerFour, onTap: onTapFour)
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
