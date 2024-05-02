import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 52),
              Image.asset(OnBoardingModel.onBoardingView[index].image),
              const SizedBox(height: 40),
              Text(OnBoardingModel.onBoardingView[index].title,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(height: 24),
              Text(OnBoardingModel.onBoardingView[index].subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                  )),
              const SizedBox(height: 40),
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 77,
                      height: 77,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: OnBoardingModel.onBoardingView[index].color,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
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
                              icon: const Icon(Icons.arrow_forward_rounded,
                                  size: 30),
                              color: AppColor.grey,
                            )
                          : const NextTextButton(),
                    ),
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
              .saveData(key: 'OnBoardingVisited', value: true);
          GoRouter.of(context).pushReplacement(AppRouter.signInView);
        },
        child: Text(
          S.of(context).next,
          style: const TextStyle(fontSize: 20),
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
              .saveData(key: 'OnBoardingVisited', value: true);
          GoRouter.of(context).pushReplacement(AppRouter.signInView);
        },
        child: Text(S.of(context).skip,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: AppColor.grey,
            )));
  }
}
