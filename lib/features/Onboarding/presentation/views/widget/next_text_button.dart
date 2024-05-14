import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/generated/l10n.dart';

class NextTextButton extends StatelessWidget {
  const NextTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          getIt
              .get<CacheHelper>()
              .saveData(key: CacheHelperKey.onBoardingVisited, value: true);
          GoRouter.of(context).pushReplacement(AppRouter.signInView);
        },
        child: Text(
          S.of(context).next,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.grey,
              ),
        ));
  }
}
