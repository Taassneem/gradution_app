import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isTask = false,
  });
  final String text;
  final void Function()? onPressed;
  final bool isTask;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: isTask ? AppColor.pink : AppColor.purple,
              fixedSize: const Size(250, 50)),
          onPressed: onPressed,
          child: Row(
            children: [
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          )),
    );
  }
}
