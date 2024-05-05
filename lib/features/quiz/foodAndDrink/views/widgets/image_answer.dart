import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class ImageAnswer extends StatelessWidget {
  const ImageAnswer({
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
        height: 200,
        width: 155,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Image.asset(image)),
      ),
    );
  }
}
