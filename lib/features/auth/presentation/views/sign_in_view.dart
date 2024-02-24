import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_string.dart';
import 'package:gradution_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.backOn1),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter)),
              child: SafeArea(
                child: Column(children: [
                  const SizedBox(height: 64),
                  CustomWelcomeText(
                      welcome: AppString.signInWelcome,
                      welcomeSubTitle: AppString.signInSubTitle),
                  const SizedBox(height: 40),
                  const SignInForm()
                ]),
              ),
            ),
          )
        ]);
      },
    ));
  }
}
