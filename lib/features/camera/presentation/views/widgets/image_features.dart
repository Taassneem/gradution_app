import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class ImageFeatures extends StatelessWidget {
  const ImageFeatures({
    super.key,
    required this.image,
    required this.type,
    this.onTap,
  });
  final String image;
  final String type;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.purple,
            radius: 40,
            child: Image.asset(image),
          ),
          Text(type, style: Theme.of(context).textTheme.titleSmall)
        ],
      ),
    );
  }
}
