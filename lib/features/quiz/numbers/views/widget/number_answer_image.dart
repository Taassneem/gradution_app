import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class ImageAnswerNumber extends StatelessWidget {
  const ImageAnswerNumber({
    super.key,
    required this.number,
    this.isWhite = false,
    this.onTap,
  });
  final bool isWhite;
  final String number;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: isWhite ? Colors.white : AppColor.babyBlue,
        child: Image.asset(number),
      ),
    );
  }
}
