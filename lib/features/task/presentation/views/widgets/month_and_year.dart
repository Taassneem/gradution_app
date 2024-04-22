import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 18.0) +
          const EdgeInsets.only(top: 18),
      child: Row(
        children: [
          const Icon(Icons.calendar_month_outlined),
          const SizedBox(width: 15),
          Text(
            '$monthName ,${today.year}',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
