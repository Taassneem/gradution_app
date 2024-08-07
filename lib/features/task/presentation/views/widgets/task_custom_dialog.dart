import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../edit_task_view.dart';

class TaskCustomDialog extends StatelessWidget {
  const TaskCustomDialog({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0.r),
      child: Align(
        alignment: isArabic() ? Alignment.bottomLeft : Alignment.bottomRight,
        child: Card(
          child: Container(
            height: 155.h,
            width: 190.w,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20.w)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                EditTaskView(taskModel: taskModel)));
                  },
                  tileColor: AppColor.screenColor,
                  leading: const Icon(Icons.edit_outlined),
                  title: Text(S.of(context).editTask),
                ),
                BlocConsumer<TaskCubit, TaskState>(
                  listener: (context, state) {
                    if (state is DeleteTaskSuccess) {
                      showToast(state.deleteTaskModel.message, task: true);
                      BlocProvider.of<TaskCubit>(context).fetchTasks();
                      Navigator.pop(context);
                    }
                    if (state is DeleteTaskFailure) {
                      showToast(state.errorMessage, task: true);
                    }
                  },
                  builder: (context, state) {
                    return ListTile(
                      tileColor: AppColor.screenColor,
                      leading: const Icon(
                        Icons.delete_outline_rounded,
                        color: AppColor.error,
                      ),
                      onTap: () {
                        BlocProvider.of<TaskCubit>(context)
                            .deleteTask(id: taskModel.id);
                      },
                      title: Text(
                        S.of(context).delete,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColor.error),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
