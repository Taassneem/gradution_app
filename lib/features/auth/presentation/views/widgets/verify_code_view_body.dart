import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../../core/utils/app_assets.dart';
import 'change_email_text_button.dart';
import 'custom_elevated_button.dart';
import 'custom_welcome_text.dart';
import 'receive_code_again.dart';
import 'verification_otp.dart';

class VerifyCodeViewBody extends StatelessWidget {
  const VerifyCodeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.forgetBack2),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter)),
        child: Column(children: [
          const SizedBox(height: 40),
          CustomWelcomeText(
              welcome: S.of(context).verification,
              welcomeSubTitle: S.of(context).verificationSubTitle),
          const SizedBox(height: 40),
          const VerificationOTP(),
          const SizedBox(height: 40),
          const ReciveCodeAgain(),
          const SizedBox(height: 24),
          CustomElevatedButton(
            text: S.of(context).confirm,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.newPassView);
            },
          ),
          const SizedBox(height: 24),
          const ChangeEmailTextButton()
        ]));
  }
}
