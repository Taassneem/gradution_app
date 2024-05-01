import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.animalQuiz), fit: BoxFit.fill)),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onTapOne,
                child: CircleAvatar(
                    backgroundColor: AppColor.white,
                    radius: 45,
                    child: Text(answerOne)),
              ),
              GestureDetector(
                onTap: onTapTwo,
                child: CircleAvatar(
                    backgroundColor: AppColor.white,
                    radius: 45,
                    child: Text(answerTwo)),
              ),
              GestureDetector(
                onTap: onTapThree,
                child: CircleAvatar(
                    backgroundColor: AppColor.white,
                    radius: 45,
                    child: Text(answerThree)),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
          Image.asset(question)
        ],
      ),
    );
  }
}
