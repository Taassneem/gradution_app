import 'package:flutter/material.dart';

class ItemField extends StatelessWidget {
  const ItemField({
    super.key,
    this.height,
    required this.color,
    required this.fieldName,
    required this.image,
    this.onTap,
  });
  final double? height;
  final Color? color;
  final String fieldName;
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: 165,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(height: 16),
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
