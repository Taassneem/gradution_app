import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';

import 'image_answer.dart';

class FoodQuizViewImageBody extends StatelessWidget {
  const FoodQuizViewImageBody(
      {super.key,
      required this.answerOne,
      required this.answerFour,
      required this.answerThree,
      required this.answerTwo,
      required this.question,
      this.onTapOne,
      this.onTapTwo,
      this.onTapThree,
      this.onTapFour});
  final String answerOne;
  final String answerFour;
  final String answerThree;
  final String answerTwo;
  final String question;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Function()? onTapThree;
  final Function()? onTapFour;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AppAssets.quizBackground))),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: BackToHome(),
            ),
            SizedBox(height: 100.h),
            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                      color: AppColor.babyBlue,
                      borderRadius: BorderRadius.circular(30.w)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageAnswer(image: answerOne, onTap: onTapOne),
                          ImageAnswer(image: answerTwo, onTap: onTapTwo)
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageAnswer(image: answerThree, onTap: onTapThree),
                          ImageAnswer(image: answerFour, onTap: onTapFour)
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: -55.h,
                    left: 70.w,
                    child: Container(
                      width: 225.w,
                      height: 85.h,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(100.w),
                        border: Border(
                            top: BorderSide(
                                color: AppColor.babyBlue, width: 2.w),
                            left: BorderSide(
                                color: AppColor.babyBlue, width: 2.w),
                            right: BorderSide(
                                color: AppColor.babyBlue, width: 2.w),
                            bottom: BorderSide(
                                color: AppColor.babyBlue, width: 2.w)),
                      ),
                      child: Center(
                        child: Text(
                          question,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
