import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/generated/l10n.dart';

class QuizFinalCongrats extends StatelessWidget {
  const QuizFinalCongrats({
    super.key,
    required this.image, required this.quiz,
  });
  final String image;
  final String quiz;
  @override
  Widget build(BuildContext context) {
    S s = S.of(context);
    return Container(
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
                Image.asset(image),
                const SizedBox(height: 40),
                Text(s.congratulations,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text(
                  quiz,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.babyBlue),
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.quizView);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(s.done,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
