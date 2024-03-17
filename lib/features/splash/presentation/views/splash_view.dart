import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/widgets/choose_lang.dart';
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
    super.initState();
    slidingAnimation();
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

  void navigate() {
    Future.delayed(
      const Duration(
        seconds: 6,
      ),
      () {
        showDialog(
          context: context,
          builder: (context) {
            return const ChooseLanguage();
          },
        );
      },
    );
  }
}
