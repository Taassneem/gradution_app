import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/common/common_lists.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

import 'custom_divider.dart';

class ReminderListView extends StatefulWidget {
  const ReminderListView({
    super.key,
  });

  @override
  State<ReminderListView> createState() => _ReminderListViewState();
}

class _ReminderListViewState extends State<ReminderListView> {
  String? selectedReminder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.white, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
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
                BlocProvider.of<TaskCubit>(context).reminder = reminder[index];
                log(reminder[index]);
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
