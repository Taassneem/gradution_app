import 'package:flutter/material.dart';

import 'widgets/password_change_view_body.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: PasswordChangeViewBody(),
      ),
    );
  }
}
