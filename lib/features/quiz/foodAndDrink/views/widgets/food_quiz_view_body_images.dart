import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.quizBackground))),
      child: Column(
        children: [
          const SizedBox(height: 130),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColor.babyBlue,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageAnswer(image: answerOne, onTap: onTapOne),
                        ImageAnswer(image: answerTwo, onTap: onTapTwo)
                      ],
                    ),
                    const SizedBox(height: 30),
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
                  top: -55,
                  left: 70,
                  child: Container(
                    width: 225,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: const Border(
                          top: BorderSide(color: AppColor.babyBlue, width: 2),
                          left: BorderSide(color: AppColor.babyBlue, width: 2),
                          right: BorderSide(color: AppColor.babyBlue, width: 2),
                          bottom:
                              BorderSide(color: AppColor.babyBlue, width: 2)),
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
    );
  }
}
