import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class TextAnswer extends StatelessWidget {
  const TextAnswer({
    super.key,
    this.onTap,
    required this.answer,
  });
  final Function()? onTap;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 155,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          answer,
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }
}
