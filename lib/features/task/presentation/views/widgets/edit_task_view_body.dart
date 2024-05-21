import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/widgets/custom_elevated_button.dart';
import 'package:intl/intl.dart';

import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'custom_divider.dart';
import 'edit_task_feature.dart';
import 'month_and_year.dart';
import 'number_of_day.dart';
import 'select_time_widgets.dart';
import 'task_title_text_field.dart';

class EditTaskViewBody extends StatelessWidget {
  EditTaskViewBody({
    super.key,
  });
  final DateTime today = DateTime.now();
  final String dayName = DateFormat('EEEE').format(DateTime.now());
  final String monthName = DateFormat('MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              Container(
                margin: EdgeInsets.all(18.r),
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    color: AppColor.screenColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    NumberOfDay(today: today, dayName: dayName),
                    MonthAndYear(
                      monthName: monthName,
                      today: today,
                      isEdit: true,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 50.h),
          Container(
            padding: EdgeInsets.all(16.r),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.w),
                    topRight: Radius.circular(50.w))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Text(S.of(context).taskTitle,
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 16.h),
                const TaskTitleTextField(),
                SizedBox(height: 16.h),
                Text(S.of(context).time,
                    style: Theme.of(context).textTheme.titleMedium),
                SelectTimeWidgets(),
                EditTaskFeature(featureName: S.of(context).selectDays),
                const CustomDivider(isTaskView: true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).addPhoto,
                          style: Theme.of(context).textTheme.titleMedium),
                      Container(
                          width: 175.w,
                          height: 95.h,
                          decoration: BoxDecoration(
                              color: AppColor.pink,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(AppAssets.quiz, height: 80.h),
                              const Icon(Icons.border_color_outlined)
                            ],
                          ))
                    ],
                  ),
                ),
                EditTaskFeature(featureName: S.of(context).reminder),
                EditTaskFeature(featureName: S.of(context).repeater),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  text: S.of(context).saveEdit,
                  color: AppColor.pink,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
