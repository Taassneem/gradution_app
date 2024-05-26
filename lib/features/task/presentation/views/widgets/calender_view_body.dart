import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:intl/intl.dart';

import 'custom_calender.dart';
import 'month_and_year.dart';
import 'task_elevated_button.dart';
import 'tasks_list_view.dart';
import 'today_number.dart';

class CalenderViewBody extends StatelessWidget {
  CalenderViewBody({super.key});

  final DateTime today = DateTime.now();
  final String dayName = DateFormat('EEEE').format(DateTime.now());
  final String monthName = DateFormat('MMMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w) +
                EdgeInsets.only(top: 15.h),
            child: MonthAndYear(monthName: monthName, today: today),
          ),
          const CustomCalender()
        ])),
        SliverFillRemaining(
          child: Container(
            width: MediaQuery.sizeOf(context).width.w,
            decoration: const BoxDecoration(color: AppColor.screenColor),
            child: Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Column(
                children: [
                  TodayNumber(today: today, dayName: dayName),
                  const TasksListView(),
                  SizedBox(height: 20.h),
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
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
