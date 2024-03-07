import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class TextAnswerNumber extends StatelessWidget {
  const TextAnswerNumber({
    super.key,
    required this.number,
    this.onTap,
    this.question = false,
    this.answerImage = false,
    this.image = '',
  });
  final String number;
  final Function()? onTap;
  final bool question;
  final bool answerImage;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 155,
          height: question ? 60 : 100,
          decoration: BoxDecoration(
              color: AppColor.babyBlue,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: answerImage
                  ? Image.asset(image)
                  : Text(number,
                      style: Theme.of(context).textTheme.titleMedium)),
        ),
      ),
    );
  }
}
