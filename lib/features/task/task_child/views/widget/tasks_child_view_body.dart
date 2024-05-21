import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/custom_calender.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/today_number.dart';
import 'package:intl/intl.dart';

import 'task_child_list_view.dart';

class TasksChildViewBody extends StatelessWidget {
  TasksChildViewBody({
    super.key,
  });

  final DateTime today = DateTime.now();
  final String dayName = DateFormat('EEEE').format(DateTime.now());
  final String monthName = DateFormat('MMMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              Row(
                children: [
                  Text(DateFormat('dd EEE MMM, yyyy').format(DateTime.now()))
                ],
              )
            ],
          ),
          const CustomCalender(isWeekCalender: true),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width.w,
              decoration: const BoxDecoration(color: AppColor.screenColor),
              child: Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Column(
                  children: [
                    TodayNumber(today: today, dayName: dayName),
                    const TasksChildListView(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
