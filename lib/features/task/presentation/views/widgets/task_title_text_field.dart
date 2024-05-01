import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        controller: BlocProvider.of<TaskCubit>(context).title,
        decoration: const InputDecoration(
          fillColor: AppColor.pink,
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
