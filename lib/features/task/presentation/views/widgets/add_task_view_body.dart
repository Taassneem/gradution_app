import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/api_keys.dart';

import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/add_photo.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/reminder.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/repeater.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'add_task_feature.dart';
import 'custom_calender.dart';
import 'custom_divider.dart';
import 'select_day_widget.dart';
import 'select_time_widgets.dart';
import 'task_title_text_field.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TaskCubit taskCubit = BlocProvider.of<TaskCubit>(context);
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          GoRouter.of(context).push(AppRouter.calendarView);
        } else if (state is AddTaskFailure) {
          log('Add Task exception ${state.errorMessage}');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: taskCubit.taskKey,
            child: Column(
              children: [
                const CustomCalender(isWeekCalender: true),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Text(S.of(context).taskTitle,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 16),
                      const TaskTitleTextField(),
                      const SizedBox(height: 16),
                      Text(S.of(context).time,
                          style: Theme.of(context).textTheme.titleMedium),
                      SelectTimeWidgets(),
                      AddTaskFeature(
                          title: S.of(context).selectDays,
                          image: AppAssets.calendarClock,
                          onTap: () {
                            getIt
                                .get<CacheHelper>()
                                .getData(key: CacheHelperKey.selectedDays);
                            customShowDialog(context,
                                widget: const SelectDayWidget());
                          }),
                      AddTaskFeature(
                        title: S.of(context).addPhoto,
                        image: AppAssets.addPhoto,
                        onTap: () {
                          customShowDialog(context, widget: const AddPhoto());
                        },
                      ),
                      AddTaskFeature(
                          title: S.of(context).repeater,
                          image: AppAssets.repeater,
                          onTap: () {
                            customShowDialog(context, widget: const Repeater());
                          }),
                      AddTaskFeature(
                          title: S.of(context).reminder,
                          image: AppAssets.reminder,
                          onTap: () {
                            customShowDialog(context, widget: const Reminder());
                          }),
                      AddTaskFeature(
                        title: S.of(context).categories,
                        image: AppAssets.categories,
                        onTap: () {
                          taskCubit.fetchCategories();
                          GoRouter.of(context).push(AppRouter.categoriesView);
                        },
                      ),
                      const CustomDivider(),
                      const SizedBox(height: 24),
                      CustomElevatedButton(
                        isTask: true,
                        text: S.of(context).saveChanges,
                        onPressed: () {
                          if (taskCubit.taskKey.currentState!.validate()) {
                            taskCubit.addTask();
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
