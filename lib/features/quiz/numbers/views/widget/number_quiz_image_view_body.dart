import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_error_widget.dart';
import 'package:gradution_app/generated/l10n.dart';
import 'package:intl/intl.dart';

import 'answer_image.dart';

class NumberQuizOneViewBody extends StatelessWidget {
  const NumberQuizOneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          Align(
            alignment:
                isArabic() ? Alignment.centerRight : Alignment.centerLeft,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.volume_up_outlined)),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(S.of(context).sum,
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          const AnswerNumber(number: AppAssets.twelve),
          const AnswerNumber(number: AppAssets.eleven),
          AnswerNumber(
            number: AppAssets.ten,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const NumberErrorWidget();
                },
              );
            },
          )
        ],
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

        // Container(
        //   decoration: const BoxDecoration(shape: BoxShape.rectangle),
        // ),
        // Center(
        //   child: Transform.rotate(
        //     angle: 45 * 3.141592653 / 180,
        //     child: Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.blue,
        //     ),
        //   ),
        // )
