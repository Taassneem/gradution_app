import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_color.dart';
import '../manager/auth_cubit/auth_cubit.dart';
import 'widgets/verify_code_view_body.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.purple,
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return const CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(child: VerifyCodeViewBody())
            ]);
          },
        ));
  }
}
