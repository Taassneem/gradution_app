import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const UserProfileImage(),
          TextWithTextField(
            textFieldName: S.of(context).fullName,
            hintText: 'Name',
            userProfile: true,
          ),
          const SizedBox(height: 24),
          TextWithTextField(
            textFieldName: S.of(context).email,
            hintText: 'email',
            userProfile: true,
          ),
          const SizedBox(height: 24),
          const ChangePasswordButton(),
          const SizedBox(height: 24),
          const DeleteAccountButton(),
          const SizedBox(height: 24),
          CustomElevatedButton(
            text: S.of(context).saveChanges,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
