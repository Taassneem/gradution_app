import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'custom_time_selector.dart';
import 'custom_time_text_field.dart';

class SelectTimeWidgets extends StatelessWidget {
  SelectTimeWidgets({
    super.key,
  });

  final TextEditingController hour = TextEditingController();
  final TextEditingController minute = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(S.of(context).hour,
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              CustomTimeTextField(controller: hour),
            ],
          ),
          const Column(
            children: [
              SizedBox(height: 24),
              CircleAvatar(backgroundColor: AppColor.black, radius: 5),
              SizedBox(height: 10),
              CircleAvatar(backgroundColor: AppColor.black, radius: 5),
            ],
          ),
          Column(
            children: [
              Text(S.of(context).min,
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              CustomTimeTextField(controller: minute, isMinute: true),
            ],
          ),
          Column(
            children: [
              CustomTimeSelector(
                time: S.of(context).am,
              ),
              const SizedBox(height: 8),
              CustomTimeSelector(
                time: S.of(context).pm,
              ),
              const SizedBox(height: 8),
            ],
          )
        ],
      ),
    );
  }
}
