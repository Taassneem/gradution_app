import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemField extends StatelessWidget {
  const ItemField({
    super.key,
    this.height,
    required this.color,
    required this.fieldName,
    required this.image,
    this.onTap,
    this.heightImage,
  });
  final double? height;
  final Color? color;
  final String fieldName;
  final String image;
  final Function()? onTap;
  final double? heightImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: 165.w,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30.w)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: heightImage),
            SizedBox(height: 15.h),
            Text(
              fieldName,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
