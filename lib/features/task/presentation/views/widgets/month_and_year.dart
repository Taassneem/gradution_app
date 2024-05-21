import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthAndYear extends StatelessWidget {
  const MonthAndYear({
    super.key,
    required this.monthName,
    required this.today,
    this.isEdit = false,
  });

  final String monthName;
  final DateTime today;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isEdit
            ? const SizedBox.shrink()
            : const Icon(Icons.calendar_month_outlined),
        SizedBox(width: 15.w),
        Text(
          '$monthName ,${today.year}',
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
