import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/widgets/custom_elevated_button.dart';
import 'package:gradution_app/features/auth/presentation/views/widgets/text_with_text_field.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            GoRouter.of(context).pushReplacement(AppRouter.signInView);
          } else if (state is ChangePasswordFailure) {
            showToast(state.errorMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: profileCubit.changePassKey,
            child: Column(
              children: [
                TextWithTextField(
                  controller: profileCubit.oldPassword,
                  textFieldName: S.of(context).theCurrentPassword,
                  hintText: S.of(context).typeYourCurrentPassword,
                  isPassword: true,
                  obscureText: true,
                ),
                SizedBox(height: 16.h),
                TextWithTextField(
                  controller: profileCubit.newPassword,
                  textFieldName: S.of(context).newPass,
                  hintText: S.of(context).newPassSubTitle,
                  finalField: true,
                  isPassword: true,
                  obscureText: true,
                ),
                SizedBox(height: 32.h),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.forgetPassView);
                    },
                    child: Text(
                      S.of(context).forgetPassQ,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    )),
                SizedBox(height: 40.h),
                state is ChangePasswordLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomElevatedButton(
                        text: S.of(context).saveChanges,
                        color: AppColor.white,
                        onPressed: () {
                          if (profileCubit.changePassKey.currentState!
                              .validate()) {
                            profileCubit.changePassword();
                          }
                        },
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
