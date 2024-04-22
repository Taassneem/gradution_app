import 'package:flutter/material.dart';
import 'package:gradution_app/generated/l10n.dart';

class TodayNumber extends StatelessWidget {
  const TodayNumber({
    super.key,
    required this.today,
    required this.dayName,
  });

  final DateTime today;
  final String dayName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${today.day} ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(
                text:
                    '${dayName[0]}${dayName[1].toUpperCase()}${dayName[2].toUpperCase()}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        Text(
          S.of(context).today,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
