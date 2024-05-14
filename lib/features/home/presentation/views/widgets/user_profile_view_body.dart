import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:gradution_app/features/auth/presentation/views/widgets/text_with_text_field.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'change_password_button.dart';
import 'delete_account_button.dart';
import 'user_profile_image.dart';

class UserProfileViewBody extends StatelessWidget {
  const UserProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0.r),
      child: Column(
        children: [
          const UserProfileImage(),
          TextWithTextField(
            textFieldName: S.of(context).fullName,
            hintText: 'Name',
            userProfile: true,
          ),
          SizedBox(height: 24.h),
          TextWithTextField(
            textFieldName: S.of(context).email,
            hintText: 'email',
            userProfile: true,
          ),
          SizedBox(height: 24.h),
          const ChangePasswordButton(),
          SizedBox(height: 24.h),
          const DeleteAccountButton(),
          SizedBox(height: 24.h),
          CustomElevatedButton(
            text: S.of(context).saveChanges,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
