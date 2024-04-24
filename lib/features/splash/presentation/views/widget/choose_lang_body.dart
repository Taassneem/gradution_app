import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';

import 'custom_ok_elevated_button.dart';

class ChoosLanguageBody extends StatelessWidget {
  const ChoosLanguageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        AppColor.purple,
        AppColor.purple,
        AppColor.screenColor,
        AppColor.babyBlue,
        AppColor.pink,
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Card(
          color: AppColor.screenColor,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Material(
              color: AppColor.screenColor,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.translate,
                        ),
                        Text(
                          ' Language/ اللغه',
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        'English / الانجليزيه',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      value: BlocProvider.of<GlobalCubit>(context).isEnglish,
                      onChanged: (value) {
                        BlocProvider.of<GlobalCubit>(context).english();
                        BlocProvider.of<GlobalCubit>(context).isEnglish =
                            value!;
                      },
                    ),
                    const Divider(
                      color: AppColor.purple,
                      thickness: 1.5,
                      indent: 20,
                      endIndent: 20,
                    ),
                    CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        'Arabic / العربيه',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      value: BlocProvider.of<GlobalCubit>(context).isArabic,
                      onChanged: (value) {
                        BlocProvider.of<GlobalCubit>(context).arabic();
                        BlocProvider.of<GlobalCubit>(context).isArabic = value!;
                      },
                    ),
                    CustomOkElevatedButton(
                      isPurple: true,
                      onPressed: () {
                        getIt
                            .get<CacheHelper>()
                            .saveData(key: 'languageChossed', value: true);
                        bool onBoardingVisited = getIt
                                .get<CacheHelper>()
                                .getData(key: 'OnBoardingVisited') ??
                            false;
                        bool signedIn =
                            getIt.get<CacheHelper>().getData(key: 'SignedIn') ??
                                false;
                        bool signedOut =
                            getIt.get<CacheHelper>().getData(key: 'SignedUp') ??
                                false;
                        if (onBoardingVisited == true) {
                          if (signedIn == true || signedOut == true) {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.homeView);
                          } else {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.signInView);
                          }
                        } else {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.onBoardingView);
                        }
                      },
                    )
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
