import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:intl/intl.dart';

class TaskChildViewBody extends StatelessWidget {
  const TaskChildViewBody({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Container(
              margin: EdgeInsets.all(18.r),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                  color: AppColor.screenColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Text(DateFormat('dd EEE MMM, yyyy').format(taskModel.date!))
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 200.h),
        CachedNetworkImage(imageUrl: taskModel.image!.url!),
        Container(
          color: AppColor.white,
          child: Column(
            children: [
              Row(children: [
                Text(
                  DateFormat('h:mm a').format(
                      DateFormat("EEE MMM dd yyyy HH:mm:ss 'GMT'Z")
                          .parse(taskModel.time!)
                          .toUtc()
                          .add(const Duration(hours: 5))),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ]),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.pink,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(taskModel.title!),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.pink,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(Icons.volume_up),
              )
            ],
          ),
        )
      ],
    );
  }
}
