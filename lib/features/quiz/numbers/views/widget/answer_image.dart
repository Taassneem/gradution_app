import 'package:flutter/material.dart';

class AnswerNumber extends StatelessWidget {
  const AnswerNumber({
    super.key,
    required this.number,
    this.onTap,
  });
  final String number;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Image.asset(number),
        ),
      ),
    );
  }
}
