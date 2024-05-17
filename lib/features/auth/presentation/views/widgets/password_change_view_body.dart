import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../../core/utils/widgets/custom_elevated_button.dart';

class PasswordChangeViewBody extends StatelessWidget {
  const PasswordChangeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.forgetBack4),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter)),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.22.h),
          Image.asset(AppAssets.passwordChanged),
          SizedBox(height: size.height * 0.06.h),
          SizedBox(
            width: 200.w,
            child: Text(
              S.of(context).changeSuccessfully,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 32.h),
          CustomElevatedButton(
            text: S.of(context).backToLogin,
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.signInView);
            },
          )
        ],
      ),
    );
  }
}
