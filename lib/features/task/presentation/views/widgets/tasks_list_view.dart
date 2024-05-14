import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/widgets/custom_shimmer.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

import 'coming_soon_widget.dart';
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
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.449.h,
                child: state.tasks.isEmpty
                    ? const ComingSoonWidget()
                    : ListView.builder(
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
        } else if (state is FetchTasksLoading) {
          return const CustomShimmer(width: 300, height: 90);
        } else if (state is DeleteTaskSuccess) {
          return showToast(state.deleteTaskModel.message);
        } else {
          return const CustomShimmer(width: 300, height: 90);
        }
      },
    );
  }
}
