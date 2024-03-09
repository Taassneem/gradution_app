import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../../core/utils/app_router.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'custom_elevated_button.dart';
import 'text_with_text_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    S s = S.of(context);
    return Container(
        width: 311,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: authCubit.forgetKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    TextWithTextField(
                        textFieldName: s.mail,
                        hintText: s.mailHelpText,
                        icon: Icons.mail_outline),
                    const SizedBox(height: 35),
                    CustomElevatedButton(
                        text: s.sendVerificationCode,
                        onPressed: () {
                          if (authCubit.forgetKey.currentState!.validate()) {
                            GoRouter.of(context).push(AppRouter.verifyCodeView);
                          }
                        }),
                  ]),
            )));
  }
}
