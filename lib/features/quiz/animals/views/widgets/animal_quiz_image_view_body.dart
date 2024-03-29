import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/quiz/animals/views/widgets/animal_image_answer.dart';

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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.45),
            AnimalQuestion(
              question: question,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
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
