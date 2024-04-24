import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class CustomOkElevatedButton extends StatelessWidget {
  const CustomOkElevatedButton({
    super.key,
    this.onPressed,
    this.isPurple = false,
  });
  final void Function()? onPressed;
  final bool isPurple;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: isPurple ? AppColor.purple : AppColor.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
        onPressed: onPressed,
        child: Text(
          S.of(context).ok,
          style: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
