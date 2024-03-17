import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../manager/auth_cubit/auth_cubit.dart';
import 'widgets/custom_welcome_text.dart';
import 'widgets/new_password_view_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
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
                            welcome: s.newPass,
                            welcomeSubTitle: s.newPassSubTitle),
                        const SizedBox(height: 24),
                        const NewPasswordViewBody()
                      ]))))
            ]);
          },
        ));
  }
}
