import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/core/utils/widgets/custom_elevated_button.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'add_photo.dart';
import 'add_task_feature.dart';
import 'custom_divider.dart';
import 'reminder.dart';
import 'repeater.dart';
import 'select_day_widget.dart';
import 'select_time_widgets.dart';
import 'task_title_text_field.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({super.key});
  @override
  Widget build(BuildContext context) {
    TaskCubit taskCubit = BlocProvider.of<TaskCubit>(context);
    return Container(
      padding: EdgeInsets.all(16.r),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.w), topRight: Radius.circular(50.w))),
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
          AddTaskFeature(
              title: S.of(context).selectDays,
              image: AppAssets.calendarClock,
              onTap: () {
                getIt
                    .get<CacheHelper>()
                    .getData(key: CacheHelperKey.selectedDays);
                customShowDialog(context, widget: const SelectDayWidget());
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
          SizedBox(height: 24.h),
          CustomElevatedButton(
            color: AppColor.pink,
            text: S.of(context).saveChanges,
            onPressed: () {
              if (taskCubit.taskKey.currentState!.validate()) {
                taskCubit.taskKey.currentState!.save();
                taskCubit.addTask();
                taskCubit.title.clear();
              }
            },
          )
        ],
      ),
    );
  }
}
