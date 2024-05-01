import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:gradution_app/core/utils/app_color.dart';

class HexagonShape extends StatelessWidget {
  const HexagonShape({
    super.key,
    required this.number,
    this.onTap,
    this.isOneNumber = false,
    this.isColored = false,
  });
  final String number;
  final Function()? onTap;
  final bool isOneNumber;
  final bool isColored;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipPath(
            clipper: HexagonClipper(),
            child: Container(
              width: 100,
              height: 100,
              color: isColored ? AppColor.babyBlue :  AppColor.white,
            ),
          ),
          Positioned(
            top: 24,
            right: isOneNumber ? 38 : 28,
            child:
                Text(number, style: Theme.of(context).textTheme.headlineMedium),
          )
        ],
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final Path path = Path();

    for (int i = 0; i < 6; i++) {
      final double angle = 2 * math.pi / 6 * (i + 0.5);
      final double x = centerX + radius * math.cos(angle);
      final double y = centerY + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
