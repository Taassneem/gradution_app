import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'text_answer.dart';

class FoodQuizViewTextBody extends StatelessWidget {
  const FoodQuizViewTextBody(
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.quizBackground))),
      child: Column(
        children: [
          SizedBox(height: 120.h),
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
                        TextAnswer(answer: answerOne, onTap: onTapOne),
                        TextAnswer(answer: answerTwo, onTap: onTapTwo),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextAnswer(answer: answerThree, onTap: onTapThree),
                        TextAnswer(answer: answerFour, onTap: onTapFour),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: -65.h,
                  left: 120.w,
                  child: Container(
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border(
                          top: BorderSide(color: AppColor.babyBlue, width: 2.w),
                          left:
                              BorderSide(color: AppColor.babyBlue, width: 2.w),
                          right:
                              BorderSide(color: AppColor.babyBlue, width: 2.w),
                          bottom:
                              BorderSide(color: AppColor.babyBlue, width: 2.w)),
                    ),
                    child: Image.asset(question),
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
