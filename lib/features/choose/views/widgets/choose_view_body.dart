import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/app_string.dart';
import 'package:gradution_app/core/utils/widgets/custom_back_app_bar.dart';

import 'choosen_type.dart';

class ChooseViewBody extends StatelessWidget {
  const ChooseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackAppBar(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      AppString.choose,
                      style: text.titleMedium
                    ),
                    const SizedBox(height: 24),
                    ChoosenType(
                      image: AppAssets.child,
                      type: AppString.child,
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.homeView);
                      },
                    ),
                    ChoosenType(
                      image: AppAssets.parent,
                      type: AppString.parent,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
