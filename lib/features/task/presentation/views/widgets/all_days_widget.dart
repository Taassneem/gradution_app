import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/generated/l10n.dart';

class AllDaysWidget extends StatelessWidget {
  const AllDaysWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(S.of(context).allDays,
            style: Theme.of(context).textTheme.titleSmall),
        CupertinoSwitch(
          value: false,
          onChanged: (value) {},
        )
      ],
    );
  }
}
