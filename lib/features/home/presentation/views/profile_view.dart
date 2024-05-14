import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.screenColor,
      body: SafeArea(child: ProfileViewBody()),
    );
  }
}
