import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'number_of_day.dart';

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NumberOfDay(today: today, dayName: dayName),
            Text(
              S.of(context).today,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        SizedBox(height: 8.h)
      ],
    );
  }
}
