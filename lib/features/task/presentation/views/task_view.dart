import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/task_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      appBar: AppBar(
        backgroundColor: AppColor.pink,
        leading: CircleAvatar(
          radius: 50,
          child: Image.asset(AppAssets.profilePic)),
        leadingWidth: 80,
        title: Text(
          S.of(context).welcome,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColor.white),
        ),
      ),
      body: const TaskViewBody(),
    );
  }
}
