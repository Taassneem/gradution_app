import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/forget_pass_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purple,
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(
                  child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.forgetBack),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter)),
                      child: Column(children: [
                        const SizedBox(height: 40),
                        CustomWelcomeText(
                            welcome: AppString.forgetPass,
                            welcomeSubTitle: AppString.forgetPassSubTitle),
                        const SizedBox(height: 40),
                        const ForgetPasswordForm()
                      ])))
            ]);
          },
        ));
  }
}
