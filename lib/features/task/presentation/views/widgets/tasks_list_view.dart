import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

import 'task_copmonent_list_view.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is FetchTasksSuccess) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskListViewComponent(
                      taskModel: state.tasks[index],
                    );
                  },
                ),
              ),
             
            ],
          );
        } else if (state is FetchTasksFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(color: AppColor.black));
        }
      },
    );
  }
}
