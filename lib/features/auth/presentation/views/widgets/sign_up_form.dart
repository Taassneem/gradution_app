import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../../core/utils/app_router.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'custom_elevated_button.dart';
import 'text_with_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    S s = S.of(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showToast(s.signedUpSuccessfully);
          GoRouter.of(context).pushReplacement(AppRouter.signInView);
        } else if (state is SignUpFailure) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: AppColor.white),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: authCubit.signUnKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        // const CustomFullName(),
                        TextWithTextField(
                          textFieldName: s.fullName,
                          hintText: s.nameHelpText,
                          controller: authCubit.signUpName,
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 16),
                        TextWithTextField(
                            textFieldName: s.mail,
                            hintText: s.mailHelpText,
                            controller: authCubit.signUpEmail,
                            icon: Icons.mail_outline),
                        const SizedBox(height: 16),
                        TextWithTextField(
                          textFieldName: s.password,
                          hintText: s.passwordValidate,
                          controller: authCubit.signUpPassword,
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        TextWithTextField(
                          textFieldName: s.confirmPassword,
                          hintText: s.mustBeBoth,
                          controller: authCubit.confirmPassword,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        state is SignUpLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomElevatedButton(
                                text: s.signUP,
                                onPressed: () {
                                  if (authCubit.signUnKey.currentState!
                                      .validate()) {
                                    authCubit.signUp();
                                    getIt
                                        .get<CacheHelper>()
                                        .saveData(key: 'SignedUp', value: true);
                                  }
                                })
                      ]),
                )));
      },
    );
  }
}
