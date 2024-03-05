import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_string.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'custom_elevated_button.dart';
import 'custom_text_button.dart';
import 'text_with_text_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showToast('success');
          GoRouter.of(context).pushReplacement(AppRouter.chooseView);
        } else if (state is SignInFailure) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
            width: 315,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: authCubit.signInKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        TextWithTextField(
                            textFieldName: 'E-mail',
                            hintText: 'Enter your email address',
                            controller: authCubit.signInEmail,
                            icon: Icons.mail_outline),
                        const SizedBox(height: 24),
                        TextWithTextField(
                          textFieldName: 'Password',
                          hintText: 'Enter your password',
                          controller: authCubit.signInPassword,
                          obscureText: true,
                        ),
                        CustomTextButton(
                            text: '${AppString.forgetPass} ?',
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.forgetPassView);
                            }),
                        const SizedBox(height: 32),
                        CustomElevatedButton(
                            text: 'Login',
                            onPressed: () {
                              if (authCubit.signInKey.currentState!
                                  .validate()) {
                                authCubit.signIn();
                                getIt
                                    .get<CacheHelper>()
                                    .saveData(key: 'SignedIn', value: true);
                              }
                            }),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                GoRouter.of(context).push(AppRouter.signUpView);
                              },
                              child: Text('Create An Account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: AppColor.lightGrey))),
                        )
                      ]),
                )));
      },
    );
  }
}