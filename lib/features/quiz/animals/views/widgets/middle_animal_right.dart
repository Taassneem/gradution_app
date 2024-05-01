import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class MiddleAnimalRight extends StatelessWidget {
  const MiddleAnimalRight({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.animalRight),
              Text(
                S.of(context).success,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                S.of(context).correct,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColor.right),
                onPressed: onPressed,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).continue1,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// GestureDetector(
//   onTap: onPressed,
//   child: Container(
//     padding: EdgeInsets.zero,
//     height: 50,
//     width: 180,
//     decoration: const BoxDecoration(
//         image: DecorationImage(image: AssetImage(AppAssets.right))),
//     child: Center(
//       child: Text(
//         AppString.next,
//         style: Theme.of(context)
//             .textTheme
//             .titleSmall!
//             .copyWith(color:  AppColor.white),
//       ),
//     ),
//   ),
// )
