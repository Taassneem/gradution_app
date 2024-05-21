import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/common/common_lists.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

import 'custom_divider.dart';

class RepeaterListView extends StatefulWidget {
  const RepeaterListView({
    super.key,
    this.isEditTask = false,
  });
  final bool isEditTask;
  @override
  State<RepeaterListView> createState() => _RepeaterListViewState();
}

class _RepeaterListViewState extends State<RepeaterListView> {
  String? selectedRepeater;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.r),
      padding:
          EdgeInsets.symmetric(horizontal: 8.w) + EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.white, width: 1.5.w),
          borderRadius: BorderRadius.circular(10.w)),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3.h,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const CustomDivider();
          },
          itemCount: repeater.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile<String>(
              value: repeater[index],
              groupValue: selectedRepeater,
              activeColor: AppColor.divider,
              onChanged: (value) {
                setState(() {
                  selectedRepeater = value;
                });
                widget.isEditTask
                    ? BlocProvider.of<TaskCubit>(context).editRepeater =
                        repeater[index]
                    : BlocProvider.of<TaskCubit>(context).repeater =
                        repeater[index];
              },
              title: Text(repeater[index],
                  style: Theme.of(context).textTheme.titleSmall),
            );
          },
        ),
      ),
    );
  }
}
