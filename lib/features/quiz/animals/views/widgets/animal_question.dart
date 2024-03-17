import 'package:flutter/material.dart';

class AnimalQuestion extends StatelessWidget {
  const AnimalQuestion({
    super.key,
    required this.question,
  });
  final String question;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          question,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
