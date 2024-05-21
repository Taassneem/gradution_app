import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageForAi extends StatelessWidget {
  const ImageForAi({
    super.key,
    required this.path,
  });
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.46.h,
        width: MediaQuery.sizeOf(context).width * 0.8.w,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: MemoryImage(base64Decode(path)),
            ),
            borderRadius: BorderRadius.circular(20.w)));
  }
}
