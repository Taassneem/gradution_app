import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthAndYear extends StatelessWidget {
  const MonthAndYear({
    super.key,
    required this.monthName,
    required this.today,
  });

  final String monthName;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 18.0.w) + EdgeInsets.only(top: 15.h),
      child: Row(
        children: [
          const Icon(Icons.calendar_month_outlined),
          SizedBox(width: 15.w),
          Text(
            '$monthName ,${today.year}',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
