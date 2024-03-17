import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/generated/l10n.dart';

class ChangeEmailTextButton extends StatelessWidget {
  const ChangeEmailTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        child: Text(
          S.of(context).changeEmail,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(decoration: TextDecoration.underline),
        ));
  }
}
