import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class NumberQuestionCircular extends StatelessWidget {
  const NumberQuestionCircular({
    super.key,
    required this.question,
  });
  final String question;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 90,
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(question, style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
