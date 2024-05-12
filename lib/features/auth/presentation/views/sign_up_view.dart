import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/widgets/back_icon.dart';
import 'package:gradution_app/generated/l10n.dart';
import '../../../../core/utils/app_assets.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.signUpBack),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter)),
              child: SafeArea(
                  child: Column(children: [
                const BackIcon(),
                SizedBox(height: 16.h),
                CustomWelcomeText(
                    welcome: S.of(context).welcome,
                    welcomeSubTitle: S.of(context).createAcc),
                SizedBox(height: 24.h),
                const SignUpForm()
              ]))))
    ]));
  }
}
