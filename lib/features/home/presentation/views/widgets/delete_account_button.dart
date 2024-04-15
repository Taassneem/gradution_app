import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.error, width: 1.5)),
      child: ListTile(
        leading: const Icon(
          Icons.delete_outline,
          color: AppColor.error,
        ),
        title: Text(S.of(context).deleteAccount,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColor.error)),
      ),
    );
  }
}
