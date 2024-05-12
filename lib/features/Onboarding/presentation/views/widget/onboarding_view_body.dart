import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/Onboarding/data/models/on_boarding_model.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/database/cache/cache_helper.dart';

class OnBoardingViewBody extends StatelessWidget {
  OnBoardingViewBody({
    super.key,
  });

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              OnBoardingModel.onBoardingView[index].imageBack,
            ),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              SizedBox(height: index != 3 ? 27.h : 60.h),
              Image.asset(OnBoardingModel.onBoardingView[index].image),
              SizedBox(height: 40.h),
              Text(OnBoardingModel.onBoardingView[index].title,
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 24.h),
              SizedBox(
                width: 300.w,
                child: Text(OnBoardingModel.onBoardingView[index].subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              SizedBox(height: index != 3 ? 40.h : 70.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index != 3 ? const SkipTextButton() : Container(),
                  SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: ScaleEffect(
                        activeDotColor:
                            OnBoardingModel.onBoardingView[index].color,
                        activeStrokeWidth: 1,
                        dotWidth: 10,
                        dotHeight: 10,
                        dotColor: AppColor.ligthGrey,
                        offset: 0.5,
                      )),
                  Container(
                    alignment: Alignment.center,
                    width: 65.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: OnBoardingModel.onBoardingView[index].color,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 18,
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 15),
                          )
                        ]),
                    child: index != 3
                        ? IconButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.slowMiddle);
                            },
                            icon: const Icon(Icons.arrow_forward_rounded),
                            color: AppColor.grey,
                          )
                        : const NextTextButton(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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

class SkipTextButton extends StatelessWidget {
  const SkipTextButton({
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
        child: Text(S.of(context).skip,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.grey,
                )));
  }
}
