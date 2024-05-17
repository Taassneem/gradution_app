import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'text_with_text_field.dart';
import '../../../../../core/utils/widgets/custom_elevated_button.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    S s = S.of(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showToast(state.resetModel.message!);
          GoRouter.of(context).pushReplacement(AppRouter.passwordChanged);
        } else if (state is ResetPasswordFailure) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
            width: 330.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                color: AppColor.white),
            child: Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Form(
                  key: authCubit.newPassKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        TextWithTextField(
                            controller: authCubit.resetNewPassword,
                            textFieldName: s.password,
                            hintText: s.passwordValidate,
                            obscureText: true),
                        SizedBox(height: 16.h),
                        TextWithTextField(
                          controller: authCubit.resetConfirmPassword,
                          textFieldName: s.confirmPassword,
                          hintText: s.mustBeBoth,
                          icon: Icons.check,
                          obscureText: true,
                          finalField: true,
                        ),
                        SizedBox(height: 32.h),
                        state is ResetPasswordLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomElevatedButton(
                                text: s.resetPassword,
                                onPressed: () {
                                  if (authCubit.newPassKey.currentState!
                                      .validate()) {
                                    authCubit.resetPassword();
                                  }
                                })
                      ]),
                )));
      },
    );
  }
}
