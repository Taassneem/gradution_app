import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/task_elevated_button.dart';
import 'package:intl/intl.dart';

import 'custom_calender.dart';
import 'month_and_year.dart';
import 'tasks_component.dart';
import 'today_number.dart';

class CalenderViewBody extends StatelessWidget {
  CalenderViewBody({super.key});

  final DateTime today = DateTime.now();
  final String dayName = DateFormat('EEEE').format(DateTime.now());
  final String monthName = DateFormat('MMMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MonthAndYear(monthName: monthName, today: today),
        const CustomCalender(),
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(color: AppColor.screenColor),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TodayNumber(today: today, dayName: dayName),
                const TasksComponent(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TaskElevatedButton(
                      isWhite: false,
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.addTaskView);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
