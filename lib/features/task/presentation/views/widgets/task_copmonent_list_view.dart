import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
