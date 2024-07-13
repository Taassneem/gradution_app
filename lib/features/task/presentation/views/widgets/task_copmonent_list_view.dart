import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_show_dialog.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/features/task/presentation/views/edit_task_view.dart';
import 'package:gradution_app/features/task/task_child/views/task_child_view.dart';

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
    // DateTime parsedTime = DateFormat.jm('en_US').parse(taskModel.time!);
    // DateTime utcTime =
    //     DateTime.utc(0, 1, 1, parsedTime.hour, parsedTime.minute);

    // final egyptTimezone = tz.getLocation('Africa/Cairo');
    // tz.TZDateTime egyptTime = tz.TZDateTime.from(utcTime, egyptTimezone);

    // DateFormat outputFormat = DateFormat('h:mm a');
    // String formattedTime = outputFormat.format(egyptTime);

    return GestureDetector(
      onTap: () {
        isChild
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: context.read<TaskCubit>(),
                        child: TaskChildView(taskModel: taskModel))),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: context.read<TaskCubit>(),
                        child: EditTaskView(taskModel: taskModel))),
              );
      },
      child: Column(
        children: [
          // isArabic()?
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.pink,
                radius: 10.r,
              ),
              SizedBox(width: 10.w),
              Text(
                taskModel.time!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          // : Row(
          //     children: [
          //       Text(
          //         formattedTime,
          //         style: Theme.of(context).textTheme.titleMedium,
          //       ),
          //       SizedBox(width: 10.w),
          //       CircleAvatar(
          //         backgroundColor: AppColor.pink,
          //         radius: 10.r,
          //       ),
          //     ],
          //   ),
          Padding(
            padding: isArabic()
                ? EdgeInsets.only(right: 28.w)
                : EdgeInsets.only(left: 28.0.w),
            child: Row(
              children: [
                Container(
                  width: 2.w,
                  height: 88.h,
                  decoration: const BoxDecoration(color: AppColor.pink),
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
                      contentPadding: EdgeInsets.zero,
                      leading: AspectRatio(
                        aspectRatio: 2.r,
                        child: taskModel.image != null
                            ? CachedNetworkImage(
                                imageUrl: taskModel.image!.url!,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                        color: AppColor.black)),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : Image.asset(AppAssets.quiz),
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
