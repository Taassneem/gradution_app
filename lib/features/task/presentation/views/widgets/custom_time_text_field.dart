import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CustomTimeTextField extends StatelessWidget {
  const CustomTimeTextField({
    super.key,
    required this.controller,
    this.isMinute = false,
  });
  final TextEditingController controller;
  final bool isMinute;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 80,
        child: TextField(
          controller: controller,
          maxLength: 2,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
          textInputAction:
              isMinute ? TextInputAction.done : TextInputAction.next,
          decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: AppColor.pink,
              filled: true,
              counter: SizedBox.shrink()),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
