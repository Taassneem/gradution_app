import 'package:flutter/material.dart';

class UploadPhotoFeature extends StatelessWidget {
  const UploadPhotoFeature({
    super.key,
    required this.feature,
    this.horizontal = 50,
    this.onTap,
  });
  final String feature;
  final double horizontal;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 11),
          child: Text(
            feature,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
