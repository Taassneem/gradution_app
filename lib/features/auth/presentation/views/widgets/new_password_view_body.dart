import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'text_with_text_field.dart';
import 'custom_elevated_button.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    S s = S.of(context);
    return Container(
        width: 330,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: AppColor.white),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: authCubit.newPassKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    TextWithTextField(
                        textFieldName: s.password,
                        hintText: s.passwordValidate,
                        obscureText: true),
                    const SizedBox(height: 16),
                    TextWithTextField(
                        textFieldName: s.confirmPassword,
                        hintText: s.mustBeBoth,
                        icon: Icons.check),
                    const SizedBox(height: 32),
                    CustomElevatedButton(
                        text: s.resetPassword,
                        onPressed: () {
                          if (authCubit.newPassKey.currentState!.validate()) {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.passwordChanged);
                          }
                        })
                  ]),
            )));
  }
}
