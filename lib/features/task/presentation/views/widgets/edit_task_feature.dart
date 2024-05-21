import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'custom_divider.dart';

class EditTaskFeature extends StatelessWidget {
  const EditTaskFeature(
      {super.key, required this.featureName, this.hintText, this.controller});
  final String featureName;
  final String? hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(isTaskView: true),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(featureName, style: Theme.of(context).textTheme.titleMedium),
              Container(
                width: 175.w,
                decoration: BoxDecoration(
                    color: AppColor.pink,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      suffixIcon: const Icon(Icons.border_color_outlined)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
