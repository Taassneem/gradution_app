import 'package:flutter/material.dart';

import 'widgets/verify_code_view_body.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: VerifyCodeViewBody()),
      ],
    ));
  }
}
