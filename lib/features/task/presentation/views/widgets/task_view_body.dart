import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'task_elevated_button.dart';

class TaskViewBody extends StatelessWidget {
  const TaskViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(65.0),
      child: Column(
        children: [
          Image.asset(AppAssets.task2),
          const SizedBox(height: 40),
          Text(S.of(context).dailyTasks,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColor.white, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Text(
            S.of(context).itsGreatToArrangeDailyTasksToHelpYourChild,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColor.white, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          TaskElevatedButton(onPressed: () {
            BlocProvider.of<TaskCubit>(context).fetchTasks();
            GoRouter.of(context).push(AppRouter.calendarView);
          })
        ],
      ),
    );
  }
}
