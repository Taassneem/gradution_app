import 'package:flutter/material.dart';
import 'package:gradution_app/features/quiz/numbers/views/widget/hexagon_shape.dart';

import 'name_speaker.dart';
import 'number_question_circular.dart';

class NumberQuizHexagonShape extends StatelessWidget {
  const NumberQuizHexagonShape({
    super.key,
    required this.numberOne,
    required this.numberTwo,
    required this.numberThree,
    required this.numberFour,
    required this.numberFive,
    required this.numberSix,
    this.onTapOne,
    this.onTapTwo,
    this.onTapThree,
    this.onTapFour,
    this.onTapFive,
    this.onTapSix,
    this.isOneNumberFive = false,
    this.isOneNumberSix = false,
    required this.question,
  });
  final String question;
  final String numberOne;
  final String numberTwo;
  final String numberThree;
  final String numberFour;
  final String numberFive;
  final String numberSix;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Function()? onTapThree;
  final Function()? onTapFour;
  final Function()? onTapFive;
  final Function()? onTapSix;
  final bool isOneNumberFive;
  final bool isOneNumberSix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          NameSpeaker(isWhite: true, onPressed: () {}),
          const SizedBox(height: 32),
          NumberQuestionCircular(
            question: question,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HexagonShape(number: numberOne, onTap: onTapOne),
              HexagonShape(number: numberTwo, onTap: onTapTwo),
              HexagonShape(number: numberThree, onTap: onTapThree)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HexagonShape(number: numberFour, onTap: onTapFour),
              HexagonShape(
                  number: numberFive,
                  isOneNumber: isOneNumberFive,
                  onTap: onTapFive),
            ],
          ),
          HexagonShape(
              number: numberSix, isOneNumber: isOneNumberSix, onTap: onTapSix)
        ],
      ),
    );
  }
}
