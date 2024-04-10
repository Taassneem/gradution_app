import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.screenColor,
      body: SafeArea(child: ProvileViewBody()
          // BlocConsumer<AuthCubit, AuthState>(
          //   listener: (context, state) {
          //     if (state is GetUserFailure) {
          //       showToast(state.errorMessage);
          //     }
          //   },
          //   builder: (context, state) {
          //     return state is GetUserLoading
          //         ? const CircularProgressIndicator()
          //         : state is GetUserSuccess
          //             ? Column(
          //                 children: [
          //                   ListTile(
          //                     leading: Image.asset(AppAssets.model, width: 60),
          //                     title: Text(state.user.user!.userName!),
          //                     subtitle: Text(state.user.user!.email!),
          //                   )
          //                 ],
          //               )
          //             : Container();
          //   },
          // ),
          ),
    );
  }
}
