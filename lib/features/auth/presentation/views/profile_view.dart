import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is GetUserFailure) {
            showToast(state.errorMessage);
          }
        },
        builder: (context, state) {
          return state is GetUserLoading
              ? const CircularProgressIndicator()
              : state is GetUserSuccess
                  ? Column(
                      children: [
                        ListTile(
                          leading: Image.asset(AppAssets.model, width: 60),
                          title: Text(state.user.user!.userName!),
                          subtitle: Text(state.user.user!.email!),
                        )
                      ],
                    )
                  : Container();
        },
      )),
    );
  }
}
