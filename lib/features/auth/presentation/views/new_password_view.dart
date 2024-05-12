import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/widgets/back_icon.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../core/utils/app_assets.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/new_password_view_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
          child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.forgetBack3),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter)),
              child: SafeArea(
                  child: Column(
                children: [
                  const BackIcon(),
                  SizedBox(height: 16.h),
                  CustomWelcomeText(
                      welcome: s.newPass, welcomeSubTitle: s.newPassSubTitle),
                  SizedBox(height: 24.h),
                  const NewPasswordViewBody()
                ],
              ))))
    ]));
  }
}
