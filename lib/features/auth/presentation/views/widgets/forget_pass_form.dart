import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../../core/utils/app_router.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../../../../../core/utils/widgets/custom_elevated_button.dart';
import 'text_with_text_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    S s = S.of(context);
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is ForgetPasswordSuccess) {
        showToast(state.forgetModel.message!);
        GoRouter.of(context).push(AppRouter.verifyCodeView);
      } else if (state is ForgetPasswordFailure) {
        showToast(state.errorMessage);
      }
    }, builder: (context, state) {
      return Container(
          width: 311.w,
          height: 300.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.w), color: AppColor.white),
          child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Form(
                key: authCubit.forgetKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      TextWithTextField(
                        controller: authCubit.forgetEmail,
                        textFieldName: s.mail,
                        hintText: s.mailHelpText,
                        icon: Icons.mail_outline,
                        finalField: true,
                      ),
                      SizedBox(height: 35.h),
                      state is ForgetPasswordLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomElevatedButton(
                              text: s.sendVerificationCode,
                              onPressed: () {
                                if (authCubit.forgetKey.currentState!
                                    .validate()) {
                                  authCubit.forgetPassword();
                                }
                              }),
                    ]),
              )));
    });
  }
}
