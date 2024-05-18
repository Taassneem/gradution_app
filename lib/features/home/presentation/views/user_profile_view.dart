import 'package:flutter/material.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'widgets/user_profile_view_body.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).userProfile,
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(child: UserProfileViewBody()),
    );
  }
}
