import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';

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

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showToast('Signed Up Successfully');
          GoRouter.of(context).pushReplacement(AppRouter.chooseView);
        } else if (state is SignUpFailure) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
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
                          textFieldName: 'Full Name',
                          hintText: 'Enter your name',
                          controller: authCubit.signUpName,
                        ),
                        const SizedBox(height: 16),
                        TextWithTextField(
                            textFieldName: 'Email Address',
                            hintText: 'Enter your email address',
                            controller: authCubit.signUpEmail,
                            icon: Icons.mail_outline),
                        const SizedBox(height: 16),
                        TextWithTextField(
                          textFieldName: 'Password',
                          hintText: '8+cahracters,1capital letter ',
                          controller: authCubit.signUpPassword,
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        TextWithTextField(
                          textFieldName: 'Confirm Password',
                          hintText: 'Confirm Password ',
                          controller: authCubit.confirmPassword,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        state is SignUpLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomElevatedButton(
                                text: 'Sign UP',
                                onPressed: () {
                                  if (authCubit.signUnKey.currentState!
                                      .validate()) {
                                    authCubit.signUp();
                                    getIt
                                        .get<CacheHelper>()
                                        .saveData(key: 'SignUp', value: true);
                                  }
                                })
                      ]),
                )));
      },
    );
  }
}
