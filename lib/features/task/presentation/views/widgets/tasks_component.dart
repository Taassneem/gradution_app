import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'circle_custom_vertical_divider.dart';

class TasksComponent extends StatelessWidget {
  const TasksComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Column(
          children: [
            CircleWithCustomVerticalDivider(),
            CircleWithCustomVerticalDivider(),
            CircleWithCustomVerticalDivider(
              isFinalTask: true,
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(AppAssets.comingSoon),
            Text(
              S.of(context).thereAreNoTasksAddedYet,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        )
      ],
    );
  }
}
