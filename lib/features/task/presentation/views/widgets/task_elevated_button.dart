import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class TaskElevatedButton extends StatelessWidget {
  const TaskElevatedButton({
    super.key,
    this.onPressed,
    this.isWhite = true,
  });
  final void Function()? onPressed;
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 50),
            backgroundColor: isWhite ? Colors.white : AppColor.pink,
            elevation: 0),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Text(S.of(context).addTask,
                style: Theme.of(context).textTheme.titleSmall),
          ],
        ));
  }
}
