import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'widgets/task_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.pink,
      body: TaskViewBody(),
    );
  }
}
