import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

import 'widget/task_child_view_body.dart';

class TaskChildView extends StatelessWidget {
  const TaskChildView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenColor,
      body: TaskChildViewBody(taskModel: taskModel),
    );
  }
}
