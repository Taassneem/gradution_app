import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_string.dart';
import 'package:gradution_app/core/utils/widgets/custom_back_app_bar.dart';

class ChooseViewBody extends StatelessWidget {
  const ChooseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackAppBar(),
            const SizedBox(height: 32),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppString.choose,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
