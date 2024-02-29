import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_string.dart';

class FoodQuizFinalView extends StatelessWidget {
  const FoodQuizFinalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.blur))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: const Border(
                    top: BorderSide(color: AppColor.babyBlue, width: 2),
                    left: BorderSide(color: AppColor.babyBlue, width: 2),
                    right: BorderSide(color: AppColor.babyBlue, width: 2),
                    bottom: BorderSide(color: AppColor.babyBlue, width: 2)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.finalFoodQuiz),
                  const SizedBox(height: 40),
                  Text(AppString.congratulations,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text(
                    AppString.congratulationsSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
