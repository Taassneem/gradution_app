import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/home/presentation/views/widgets/change_password_view_body.dart';
import 'package:gradution_app/generated/l10n.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple,
      appBar: AppBar(
        backgroundColor: AppColor.purple,
        title: Text(S.of(context).password,
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: const ChangePasswordViewBody(),
    );
  }
}
