import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/quiz/numbers/views/hexagon_shape.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/name_speaker.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_error_widget.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/number_success_widget.dart';
import 'package:gradution_app/generated/l10n.dart';

class NumberQuizFourViewBody extends StatelessWidget {
  const NumberQuizFourViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameSpeaker(onPressed: () {}),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HexagonShape(
                number: '6',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const NumberErrorWidget();
                    },
                  );
                }),
            HexagonShape(
                number: '7',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const NumberErrorWidget();
                    },
                  );
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HexagonShape(
                number: '8',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const NumberErrorWidget();
                    },
                  );
                }),
            HexagonShape(
                number: '5',
                isOneNumber: true,
                isColored: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const NumberErrorWidget();
                    },
                  );
                }),
            HexagonShape(
              number: '4',
              isOneNumber: true,
              isColored: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return NumberSuccessWidget(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.numberQuizViewNine);
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        Text(
          S.of(context).howManyAnimalsInPicture,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.35,
              decoration: BoxDecoration(
                  color: AppColor.babyBlue,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Positioned(
              left: 35,
              top: 16,
              child: Transform.rotate(
                  angle: -5 * 3.141592653589793 / 180,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  )),
            ),
            Positioned(
                top: 30,
                left: 80,
                child: Center(child: Image.asset(AppAssets.dabdob)))
          ],
        )
      ],
    );
  }
}
