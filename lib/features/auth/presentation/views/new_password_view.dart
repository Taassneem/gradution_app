import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_router.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../manager/auth_cubit/auth_cubit.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/text_with_text_field.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

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
                              image: AssetImage(AppAssets.forgetBack3),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter)),
                      child: SafeArea(
                          child: Column(children: [
                        const SizedBox(height: 16),
                        CustomWelcomeText(
                            welcome: AppString.newPass,
                            welcomeSubTitle: AppString.newPassSubTitle),
                        const SizedBox(height: 24),
                        Container(
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Form(
                                  key: authCubit.newPassKey,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 30),
                                        const TextWithTextField(
                                          textFieldName: 'Password',
                                          hintText:
                                              '8+cahracters,1capital letter ',
                                          obscureText: true,
                                        ),
                                        const SizedBox(height: 16),
                                        const TextWithTextField(
                                            textFieldName: 'Confirm Password',
                                            hintText:
                                                'Both password must match ',
                                            icon: Icons.check),
                                        const SizedBox(height: 32),
                                        CustomElevatedButton(
                                            text: 'Reset Password',
                                            onPressed: () {
                                              if (authCubit
                                                  .newPassKey.currentState!
                                                  .validate()) {
                                                GoRouter.of(context)
                                                    .pushReplacement(AppRouter
                                                        .passwordChanged);
                                              }
                                            })
                                      ]),
                                )))
                      ]))))
            ]);
          },
        ));
  }
}
