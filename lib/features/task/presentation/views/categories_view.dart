import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      appBar: AppBar(
        backgroundColor: AppColor.pink,
      ),
      body: const CategoriesViewBody(),
    );
  }
}
