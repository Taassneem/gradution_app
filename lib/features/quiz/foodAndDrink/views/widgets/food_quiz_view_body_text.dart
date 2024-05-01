import 'package:flutter/material.dart';
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
          const SizedBox(height: 120),
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
                        TextAnswer(answer: answerOne, onTap: onTapOne),
                        TextAnswer(answer: answerTwo, onTap: onTapTwo),
                      ],
                    ),
                    const SizedBox(height: 30),
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
                  top: -65,
                  left: 120,
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color:  AppColor.white,
                      borderRadius: BorderRadius.circular(100),
                      border: const Border(
                          top: BorderSide(color: AppColor.babyBlue, width: 2),
                          left: BorderSide(color: AppColor.babyBlue, width: 2),
                          right: BorderSide(color: AppColor.babyBlue, width: 2),
                          bottom:
                              BorderSide(color: AppColor.babyBlue, width: 2)),
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
