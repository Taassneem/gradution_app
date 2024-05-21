import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:gradution_app/features/task/presentation/views/edit_task_view.dart';
import 'package:gradution_app/features/task/task_child/views/task_child_view.dart';
import 'package:intl/intl.dart';

import 'task_custom_dialog.dart';

class TaskListViewComponent extends StatelessWidget {
  const TaskListViewComponent({
    super.key,
    required this.taskModel,
    this.isChild = false,
  });
  final TaskModel taskModel;
  final bool isChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isChild
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TaskChildView(taskModel: taskModel)))
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => EditTaskView(taskModel: taskModel)));
      },
      child: Column(
        children: [
          Row(
            children: [
              Text(
                DateFormat('h:mm a').format(
                    DateFormat("EEE MMM dd yyyy HH:mm:ss 'GMT'Z")
                        .parse(taskModel.time!)
                        .toUtc()
                        .add(const Duration(hours: 5))),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(width: 10.w),
              CircleAvatar(
                backgroundColor: AppColor.pink,
                radius: 10.r,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.0.w),
            child: Row(
              children: [
                Container(
                  width: 2.w,
                  height: 88.h,
                  decoration: const BoxDecoration(
                    color: AppColor.pink,
                  ),
                ),
                SizedBox(width: 30.w),
                Expanded(
                  child: Container(
                    height: 88.h,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                        color: AppColor.pink,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: AspectRatio(
                        aspectRatio: 2.r,
                        child: CachedNetworkImage(
                          imageUrl: taskModel.image!.url!,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                  color: AppColor.black)),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      title: Text(
                        taskModel.title!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                    onTap: () {
                      customShowDialog(context,
                          widget: TaskCustomDialog(taskModel: taskModel));
                    },
                    child: const Icon(Icons.menu))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
