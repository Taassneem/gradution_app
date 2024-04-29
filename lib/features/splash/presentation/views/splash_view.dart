import 'package:flutter/material.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/splash/presentation/views/choose_lang.dart';
import 'package:gradution_app/core/utils/widgets/custom_page_route_slide.dart';
import 'package:gradution_app/features/home/presentation/views/home_view.dart';
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
        bool languageChoosed =
            getIt.get<CacheHelper>().getData(key: 'languageChoosed') ?? false;
        if (languageChoosed) {
          Navigator.pushReplacement(
              context,
              CustomPageRouteSlide(
                child: const ChooseLanguage(),
                direction: AxisDirection.up,
              ));
        } else {
          Navigator.push(
              context,
              CustomPageRouteSlide(
                child: const HomeView(),
                direction: AxisDirection.up,
              ));
        }
      },
    );
  }
}
