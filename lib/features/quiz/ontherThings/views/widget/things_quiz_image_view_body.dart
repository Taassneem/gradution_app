import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

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
                    width: 170,
                    height: 90,
                    decoration: BoxDecoration(
                        color: AppColor.babyBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      question,
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
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
                      ThingsImageAnswer(image: answerOne, onTap: onTapOne),
                      ThingsImageAnswer(image: answerTwo, onTap: onTapTwo)
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThingsImageAnswer(image: answerThree, onTap: onTapThree),
                      ThingsImageAnswer(image: answerFour, onTap: onTapFour)
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
