import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/widgets/custom_elevated_button.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/features/task/presentation/views/categories_view.dart';
import 'package:intl/intl.dart';

import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'edit_task_feature.dart';
import 'reminder.dart';
import 'repeater.dart';
import 'select_day_widget.dart';
import 'select_time_widgets.dart';
import 'task_title_text_field.dart';

class EditTaskViewBody extends StatelessWidget {
  const EditTaskViewBody({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    TaskCubit taskCubit = BlocProvider.of<TaskCubit>(context);
    return SingleChildScrollView(
      child: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is EditTaskSuccess) {
            showToast(state.editTaskModel.message!, task: true);
            taskCubit.fetchTasks();
            Navigator.pop(context);
          } else if (state is EditTaskFailure) {
            showToast(state.errorMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: taskCubit.editTaskKey,
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
                          Text(DateFormat('dd EEE MMM, yyyy')
                              .format(taskModel.date!))
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
                      TaskTitleTextField(
                        editTaskHintText: taskModel.title,
                        controller: taskCubit.editTitle,
                      ),
                      SizedBox(height: 16.h),
                      Text(S.of(context).time,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SelectTimeWidgets(),
                      EditTaskFeature(
                          featureName: S.of(context).selectDays,
                          hintText: taskModel.days.toString(),
                          onTap: () {
                            customShowDialog(context,
                                widget: const SelectDayWidget(
                                  isEditTask: true,
                                ));
                          }),
                      EditTaskFeature(
                        featureName: S.of(context).category,
                        hintText: taskModel.selectedActivity,
                        onTap: () {
                          taskCubit.fetchCategories();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const CategoriesView(
                                        isEditTask: true,
                                      )));
                        },
                      ),
                      EditTaskFeature(
                          featureName: S.of(context).reminder,
                          hintText: taskModel.reminder,
                          onTap: () {
                            customShowDialog(context,
                                widget: const Reminder(isEditTask: true));
                          }),
                      EditTaskFeature(
                          featureName: S.of(context).repeater,
                          hintText: taskModel.repeater,
                          onTap: () {
                            customShowDialog(context,
                                widget: const Repeater(isEditTask: true));
                          }),
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        text: S.of(context).saveEdit,
                        color: AppColor.pink,
                        onPressed: () {
                          if (taskCubit.editTaskKey.currentState!.validate()) {
                            taskCubit.editTask(id: taskModel.id);
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
