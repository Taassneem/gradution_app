import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class ThingsImageAnswer extends StatelessWidget {
  const ThingsImageAnswer({
    super.key,
    this.onTap,
    required this.image,
  });
  final Function()? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 166,
        width: 145,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Image.asset(image)),
      ),
    );
  }
}
