import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'widget/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideController;
  @override
  void initState() {
    bool onBoardingVisited =
        getIt.get<CacheHelper>().getData(key: 'OnBoardingVisited') ?? false;
    bool signedIn = getIt.get<CacheHelper>().getData(key: 'SignedIn') ?? false;
    bool signedOut = getIt.get<CacheHelper>().getData(key: 'SignedUp') ?? false;
    if (onBoardingVisited == true) {
      if (signedIn == true || signedOut == true) {
        navigate(path: AppRouter.homeView);
      } else {
        navigate(path: AppRouter.signInView);
      }
    } else {
      navigate(path: AppRouter.onBoardingView);
    }
    super.initState();
    slidingAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(slideController: slideController),
    );
  }

  void slidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    slideController = Tween<Offset>(
      begin: const Offset(0, 15),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigate({required String path}) {
    Future.delayed(
      const Duration(
        seconds: 6,
      ),
      () {
        GoRouter.of(context).pushReplacement(path);
      },
    );
  }
}
