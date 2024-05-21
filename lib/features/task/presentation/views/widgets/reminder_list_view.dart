import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/common/common_lists.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

import 'custom_divider.dart';

class ReminderListView extends StatefulWidget {
  const ReminderListView({
    super.key,
    this.isEditTask = false,
  });
  final bool isEditTask;
  @override
  State<ReminderListView> createState() => _ReminderListViewState();
}

class _ReminderListViewState extends State<ReminderListView> {
  String? selectedReminder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.r),
      padding:
          EdgeInsets.symmetric(horizontal: 8.w) + EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.white, width: 1.5.w),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3.h,
        child: ListView.separated(
          itemCount: reminder.length,
          separatorBuilder: (BuildContext context, int index) {
            return const CustomDivider();
          },
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile<String>(
              value: reminder[index],
              groupValue: selectedReminder,
              activeColor: AppColor.divider,
              onChanged: (value) {
                setState(() {
                  selectedReminder = value;
                });
                widget.isEditTask
                    ? BlocProvider.of<TaskCubit>(context).editReminder =
                        reminder[index]
                    : BlocProvider.of<TaskCubit>(context).reminder =
                        reminder[index];
              },
              title: Text(
                reminder[index],
                style: Theme.of(context).textTheme.titleSmall,
              ),
            );
          },
        ),
      ),
    );
  }
}
