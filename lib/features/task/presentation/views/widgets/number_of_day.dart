import 'package:flutter/material.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';

class NumberOfDay extends StatelessWidget {
  const NumberOfDay({
    super.key,
    required this.today,
    required this.dayName,
  });

  final DateTime today;
  final String dayName;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${today.day} ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isArabic()
              ? TextSpan(
                  text: dayName,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              : TextSpan(
                  text:
                      '${dayName[0]}${dayName[1].toUpperCase()}${dayName[2].toUpperCase()}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
        ],
      ),
    );
  }
}
