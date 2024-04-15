import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColor.purple, width: 1.5)),
      child: ListTile(
        leading: const Icon(Icons.lock_outline),
        title: Text(S.of(context).changePassword,
            style: Theme.of(context).textTheme.titleMedium),
        trailing: const Icon(Icons.keyboard_double_arrow_right),
      ),
    );
  }
}