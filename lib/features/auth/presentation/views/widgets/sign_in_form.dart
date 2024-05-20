import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/generated/l10n.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_router.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../../../../../core/utils/widgets/custom_elevated_button.dart';
import 'custom_text_button.dart';
import 'text_with_text_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    S s = S.of(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          showToast(state.errorMessage);
        } else if (state is SignInSuccess) {
          showToast(state.signInModel.messge!);
          GoRouter.of(context).pushReplacement(AppRouter.chooseView);
        }
      },
      builder: (context, state) {
        return Container(
            width: 315.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                color: AppColor.white),
            child: Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: authCubit.signInKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        TextWithTextField(
                            textFieldName: s.mail,
                            hintText: s.mailHelpText,
                            controller: authCubit.signInEmail,
                            icon: Icons.mail_outline),
                        SizedBox(height: 24.h),
                        TextWithTextField(
                          textFieldName: s.password,
                          hintText: s.passwordHelpText,
                          controller: authCubit.signInPassword,
                          obscureText: true,
                          finalField: true,
                          isPassword: true,
                        ),
                        CustomTextButton(
                            text: S.of(context).forgetPassQ,
                            onPressed: () {
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.forgetPassView);
                            }),
                        SizedBox(height: 32.h),
                        CustomElevatedButton(
                            text: s.login,
                            onPressed: () {
                              if (authCubit.signInKey.currentState!
                                  .validate()) {
                                authCubit.signIn();
                                getIt.get<CacheHelper>().saveData(
                                    key: CacheHelperKey.signedIn, value: true);
                              }
                            }),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.signUpView);
                              },
                              child: Text(s.createAcc,
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
