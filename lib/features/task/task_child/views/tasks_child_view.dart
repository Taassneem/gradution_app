import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'widget/tasks_child_view_body.dart';

class TasksChildView extends StatelessWidget {
  const TasksChildView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      body: TasksChildViewBody(),
    );
  }
}
