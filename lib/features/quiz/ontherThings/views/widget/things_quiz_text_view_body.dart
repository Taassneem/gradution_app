import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColor.babyBlue,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.volume_up_outlined)),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 233,
                    height: 187,
                    color: AppColor.babyBlue,
                    child: Image.asset(question)),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.13),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: AppColor.babyBlue,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThingsTextAnswer(answer: answerOne, onTap: onTapOne),
                      ThingsTextAnswer(answer: answerTwo, onTap: onTapTwo)
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThingsTextAnswer(answer: answerThree, onTap: onTapThree),
                      ThingsTextAnswer(answer: answerFour, onTap: onTapFour)
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
