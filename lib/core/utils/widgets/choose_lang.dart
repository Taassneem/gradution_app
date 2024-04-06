import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/generated/l10n.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColor.purple,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Material(
            color: AppColor.purple,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.translate,
                        height: 30,
                      ),
                      Text(
                        ' Language/ اللغه',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  CheckboxListTile(
                    title: Text(
                      'English / الانجليزيه',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    value: BlocProvider.of<GlobalCubit>(context).isEnglish,
                    onChanged: (value) {
                      BlocProvider.of<GlobalCubit>(context).english();
                      BlocProvider.of<GlobalCubit>(context).isEnglish = value!;
                    },
                  ),
                  const Divider(color: Colors.white),
                  CheckboxListTile(
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
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50)),
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
                      child: Text(
                        S.of(context).ok,
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
