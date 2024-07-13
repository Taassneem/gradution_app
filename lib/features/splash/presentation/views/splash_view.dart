// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/base/view/base_view.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/features/splash/presentation/views/choose_lang.dart';
import 'package:gradution_app/core/utils/widgets/custom_page_route_slide.dart';
import 'widget/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scalingController;
  late Animation<Offset> slideController;
  @override
  void initState() {
    super.initState();
    scalingAnimation();
    navigate();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(
        scalingController: scalingController,
      ),
    );
  }

  void scalingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    scalingController = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  void navigate() {
    Future.delayed(
      const Duration(
        seconds: 6,
      ),
      () {
        bool languageChoosed = getIt
                .get<CacheHelper>()
                .getData(key: CacheHelperKey.languageChoosed) ??
            false;
        if (languageChoosed) {
          bool onBoardingVisited = getIt
                  .get<CacheHelper>()
                  .getData(key: CacheHelperKey.onBoardingVisited) ??
              false;
          bool signedIn =
              getIt.get<CacheHelper>().getData(key: CacheHelperKey.signedIn) ??
                  false;
          bool signedUp =
              getIt.get<CacheHelper>().getData(key: CacheHelperKey.signedUp) ??
                  false;
          if (onBoardingVisited == true) {
            if (signedIn == true || signedUp == true) {
              bool parentChoosen = getIt
                      .get<CacheHelper>()
                      .getData(key: CacheHelperKey.parentChoosen) ??
                  false;
              bool childChoosen = getIt
                      .get<CacheHelper>()
                      .getData(key: CacheHelperKey.childChoosen) ??
                  false;
              if (childChoosen == true) {
                if (BlocProvider.of<GlobalCubit>(context).childOrParent ==
                    'child') {
                  BlocProvider.of<ProfileCubit>(context).getUserData();
                  Navigator.push(
                      context,
                      CustomPageRouteSlide(
                        child: const BaseView(),
                        direction: AxisDirection.up,
                      ));
                } else {
                  GoRouter.of(context).push(AppRouter.taskView);
                }
              } else if (parentChoosen == true) {
                BlocProvider.of<ProfileCubit>(context).getUserData();
                GoRouter.of(context).pushReplacement(AppRouter.taskView);
              } else {
                GoRouter.of(context).push(AppRouter.chooseView);
              }
            } else {
              GoRouter.of(context).pushReplacement(AppRouter.signInView);
            }
          } else {
            GoRouter.of(context).pushReplacement(AppRouter.onBoardingView);
          }
        } else {
          Navigator.push(
              context,
              CustomPageRouteSlide(
                child: const ChooseLanguage(),
                direction: AxisDirection.up,
              ));
        }
      },
    );
  }
}
