import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

import 'widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      body: SafeArea(
        child: EditTaskViewBody(taskModel: taskModel),
      ),
    );
  }
}
