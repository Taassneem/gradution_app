import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CircleWithCustomVerticalDivider extends StatelessWidget {
  const CircleWithCustomVerticalDivider({
    super.key,
    this.isFinalTask = false,
  });
  final bool isFinalTask;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const CircleAvatar(
          backgroundColor: AppColor.pink,
          radius: 10,
        ),
        const SizedBox(height: 16),
        isFinalTask
            ? const SizedBox.shrink()
            : Container(
                width: 2,
                height: 88,
                decoration: const BoxDecoration(
                  color: AppColor.pink,
                ),
              ),
      ],
    );
  }
}
