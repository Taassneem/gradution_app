import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';

class AnimalQuizTextViewBody extends StatelessWidget {
  const AnimalQuizTextViewBody(
      {super.key,
      required this.answerOne,
      required this.answerTwo,
      required this.answerThree,
      required this.question,
      this.onTapOne,
      this.onTapTwo,
      this.onTapThree});
  final String answerOne;
  final String answerTwo;
  final String answerThree;
  final String question;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Function()? onTapThree;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.animalQuiz), fit: BoxFit.fill)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: BackToHome(),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: onTapOne,
                  child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      radius: 45.w,
                      child: Text(answerOne)),
                ),
                GestureDetector(
                  onTap: onTapTwo,
                  child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      radius: 45.w,
                      child: Text(answerTwo)),
                ),
                GestureDetector(
                  onTap: onTapThree,
                  child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      radius: 45.w,
                      child: Text(answerThree)),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04.h),
            Image.asset(question)
          ],
        ),
      ),
    );
  }
}
