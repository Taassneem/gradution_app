import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../core/utils/app_assets.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.forgetBack4),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter)),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.22),
              Image.asset(AppAssets.passwordChanged),
              SizedBox(height: size.height * 0.06),
              SizedBox(
                width: 200,
                child: Text(
                  S.of(context).changeSuccessfully,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 32),
              CustomElevatedButton(
                text: S.of(context).backToLogin,
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.signInView);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
