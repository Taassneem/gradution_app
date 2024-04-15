import 'package:flutter/material.dart';

import 'widget/choose_lang_body.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChoosLanguageBody(),
    );
  }
}
