import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/common/common_lists.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

import 'all_days_widget.dart';
import 'custom_divider.dart';

class DaysListView extends StatefulWidget {
  const DaysListView({
    super.key,
    this.isEditTask = false,
  });
  final bool isEditTask;
  @override
  State<DaysListView> createState() => _DaysListViewState();
}

class _DaysListViewState extends State<DaysListView> {
  List<bool> isSelected = List.filled(days.length, false);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.white, width: 1.5.w),
            borderRadius: BorderRadius.circular(10.w)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.47.h,
              child: ListView.separated(
                itemCount: days.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const CustomDivider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    value: isSelected[index],
                    onChanged: (value) {
                      setState(() {
                        isSelected[index] = value!;
                        List<String> selectedDays = [];
                        for (int i = 0; i < isSelected.length; i++) {
                          if (isSelected[i]) {
                            selectedDays.add(days[i]);
                          }
                        }
                        widget.isEditTask
                            ? BlocProvider.of<TaskCubit>(context).editDays =
                                selectedDays
                            : BlocProvider.of<TaskCubit>(context).days =
                                selectedDays;
                      });
                    },
                    activeColor: AppColor.divider,
                    title: Text(days[index],
                        style: Theme.of(context).textTheme.titleSmall),
                  );
                },
              ),
            ),
            AllDaysWidget(
              selected: isSelected.every((element) => element),
              onChanged: (value) {
                widget.isEditTask
                    ? BlocProvider.of<TaskCubit>(context).editDays = days
                    : BlocProvider.of<TaskCubit>(context).days = days;
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = value;
                  }
                });
              },
            )
          ],
        ));
  }
}
