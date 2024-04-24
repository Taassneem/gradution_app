import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const TextField(
        decoration: InputDecoration(
          fillColor: AppColor.pink,
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
