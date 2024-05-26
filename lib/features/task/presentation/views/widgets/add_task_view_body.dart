import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'add_task_comp.dart';
import 'custom_calender.dart';

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
          showToast(state.model.message ?? S.of(context).addTaskSuccessfully,
              task: true);
          taskCubit.fetchTasks();
          taskCubit.title.clear();
          GoRouter.of(context).pop(context);
        } else if (state is AddTaskFailure) {
          showToast(state.errorMessage, task: true);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: taskCubit.taskKey,
            child: const Column(
              children: [
                CustomCalender(isWeekCalender: true),
                AddTaskComponent()
              ],
            ),
          ),
        );
      },
    );
  }
}
