import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'package:gradution_app/generated/l10n.dart';

class AllDaysWidget extends StatelessWidget {
  const AllDaysWidget({
    super.key,
    this.onChanged,
    this.selected = false,
  });
  final Function(bool)? onChanged;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(S.of(context).allDays,
            style: Theme.of(context).textTheme.titleSmall),
        CupertinoSwitch(
          activeColor: AppColor.grey,
          thumbColor: AppColor.bgOn1,
          value: selected,
          onChanged: onChanged,
        )
      ],
    );
  }
}
