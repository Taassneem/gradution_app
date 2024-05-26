import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key, required this.scalingController});
  final Animation<double> scalingController;

  @override
  Widget build(BuildContext context) {
    final Animation<double> borderRadiusAnimation =
        Tween<double>(begin: 250.w, end: 0.0).animate(scalingController);

    return AnimatedBuilder(
      animation: scalingController,
      builder: (context, child) {
        return ScaleTransition(
          scale: scalingController,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColor.purple,
                borderRadius:
                    BorderRadius.circular(borderRadiusAnimation.value),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.discovery),
                  Text(
                    'Discovery',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
