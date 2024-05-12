import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/widgets/back_icon.dart';
import 'package:gradution_app/generated/l10n.dart';
import '../../../../core/utils/app_assets.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/forget_pass_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.forgetBack),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter)),
                child: Column(
                  children: [
                    const BackIcon(),
                    SizedBox(height: 40.h),
                    CustomWelcomeText(
                        welcome: S.of(context).forgetPass,
                        welcomeSubTitle: S.of(context).forgetPassSubTitle),
                    SizedBox(height: 40.h),
                    const ForgetPasswordForm()
                  ],
                )))
      ]),
    ));
  }
}
