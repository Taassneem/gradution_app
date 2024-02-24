import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            )),
      ],
    );
  }
}
