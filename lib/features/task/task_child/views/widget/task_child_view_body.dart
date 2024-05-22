import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:intl/intl.dart';

import 'icon_for_task_speak.dart';

class TaskChildViewBody extends StatelessWidget {
  const TaskChildViewBody({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 450.h,
            decoration: const BoxDecoration(
                color: AppColor.pink,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(500),
                    bottomRight: Radius.circular(500))),
            child: Column(
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
                          Text(
                            DateFormat('dd EEE MMM, yyyy')
                                .format(taskModel.date!),
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 120.h),
                CachedNetworkImage(
                  imageUrl: taskModel.image!.url!,
                  width: 222,
                  height: 200,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                SizedBox(height: 34.h),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 85.h,
                  decoration: BoxDecoration(
                      color: AppColor.pink,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    taskModel.selectedActivity!,
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
                ),
                SizedBox(height: 34.h),
                IconSpeakForTask(taskModel: taskModel)
              ],
            ),
          )
        ],
      ),
    );
  }
}
