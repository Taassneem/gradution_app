import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'custom_ok_elevated_button.dart';

class ChoosLanguageBody extends StatelessWidget {
  const ChoosLanguageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          AppColor.purple,
          AppColor.purple,
          AppColor.babyBlue,
          AppColor.pink,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Center(
        child: Card(
          color: AppColor.screenColor,
          child: Padding(
            padding: EdgeInsets.all(28.r),
            child: Material(
              color: AppColor.screenColor,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      Image.asset(AppAssets.translate),
                      SizedBox(width: 8.w),
                      Text(
                        S.of(context).language,
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ]),
                    SizedBox(height: 16.h),
                    Text(S.of(context).doYouWantToUseTheArabicLanguage,
                        style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(height: 30.h),
                    CustomOkElevatedButton(
                      isPurple: true,
                      text: S.of(context).change,
                      onPressed: () {
                        isArabic()
                            ? BlocProvider.of<GlobalCubit>(context)
                                .toggleLanguage('en')
                            : BlocProvider.of<GlobalCubit>(context)
                                .toggleLanguage('ar');
                        getIt.get<CacheHelper>().saveData(
                            key: CacheHelperKey.languageChoosed, value: true);
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.onBoardingView);
                      },
                    ),
                    SizedBox(height: 8.h),
                    CustomOkElevatedButton(
                      isPurple: true,
                      text: S.of(context).skip,
                      onPressed: () {
                        getIt.get<CacheHelper>().saveData(
                            key: CacheHelperKey.languageChoosed, value: true);
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.onBoardingView);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
