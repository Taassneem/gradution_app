import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({
    super.key,
    this.editTaskHintText,
    this.controller,
  });
  final String? editTaskHintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).fieldIsRequired;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: editTaskHintText,
          fillColor: AppColor.pink,
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
