import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/home/presentation/views/widgets/profile_pic.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'task_elevated_button.dart';

class TaskViewBody extends StatelessWidget {
  const TaskViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ProfilePic(),
            Text(
              S.of(context).welcome,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.white),
            ),
            const SizedBox.shrink()
          ],
        ),
        Padding(
          padding: EdgeInsets.all(65.0.r),
          child: Column(
            children: [
              Image.asset(AppAssets.task2),
              SizedBox(height: 40.h),
              Text(S.of(context).dailyTasks,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.white, fontWeight: FontWeight.w600)),
              SizedBox(height: 16.h),
              Text(
                S.of(context).itsGreatToArrangeDailyTasksToHelpYourChild,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              TaskElevatedButton(onPressed: () {
                BlocProvider.of<TaskCubit>(context).fetchTasks();
                GoRouter.of(context).push(AppRouter.calendarView);
              })
            ],
          ),
        ),
      ],
    );
  }
}
