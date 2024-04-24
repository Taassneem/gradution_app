import 'package:flutter/material.dart';

import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      appBar: AppBar(
        title: Text(
          S.of(context).createNewTask,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: AppColor.pink,
        elevation: 0,
      ),
      body: const AddTaskViewBody(),
    );
  }
}
