import 'package:flutter/material.dart';

import 'custom_divider.dart';

class AddTaskFeature extends StatelessWidget {
  const AddTaskFeature({
    super.key,
    this.onTap,
    required this.title,
    required this.image,
  });
  final void Function()? onTap;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(isTaskView: true),
        ListTile(
          onTap: onTap,
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          trailing: Image.asset(image),
        )
      ],
    );
  }
}
