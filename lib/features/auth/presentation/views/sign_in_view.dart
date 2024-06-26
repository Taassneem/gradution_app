import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.backOn1),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter)),
          child: SafeArea(
            child: Column(children: [
              SizedBox(height: 64.h),
              CustomWelcomeText(
                  welcome: S.of(context).signInWelcome,
                  welcomeSubTitle: S.of(context).signInSubTitle),
              SizedBox(height: 40.h),
              const SignInForm()
            ]),
          ),
        ),
      )
    ]));
  }
}
