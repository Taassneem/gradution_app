import 'package:flutter/material.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

import 'task_custom_dialog.dart';

class TaskListViewComponent extends StatelessWidget {
  const TaskListViewComponent({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              taskModel.time!.split('')[16] +
                  taskModel.time!.split('')[17] +
                  taskModel.time!.split('')[18] +
                  taskModel.time!.split('')[19] +
                  taskModel.time!.split('')[20],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 16),
            const CircleAvatar(
              backgroundColor: AppColor.pink,
              radius: 10,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Row(
            children: [
              Container(
                width: 2,
                height: 88,
                decoration: const BoxDecoration(
                  color: AppColor.pink,
                ),
              ),
              const SizedBox(width: 34),
              Expanded(
                child: Container(
                  height: 88,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: AppColor.pink,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Image.network(taskModel.image!.url!),
                    title: Text(
                      taskModel.selectedActivity!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                  onTap: () {
                    customShowDialog(context, widget: const TaskCustomDialog());
                  },
                  child: const Icon(Icons.menu))
            ],
          ),
        ),
      ],
    );
  }
}
