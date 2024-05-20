import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/quiz/animals/views/widgets/animal_image_answer.dart';
import 'package:gradution_app/features/quiz/presentation/views/widgets/back_to_home.dart';

import 'animal_question.dart';

class AnimalQuizImageViewBody extends StatelessWidget {
  const AnimalQuizImageViewBody(
      {super.key,
      required this.question,
      required this.imageOne,
      required this.imageTwo,
      this.onTapOne,
      this.onTapTwo});
  final String question;
  final String imageOne;
  final String imageTwo;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.animalsQuiz), fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: BackToHome(
                isWhite: true,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.35.h),
            AnimalQuestion(question: question),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimalImageAnswer(image: imageOne, onTap: onTapOne),
                AnimalImageAnswer(image: imageTwo, onTap: onTapTwo)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
