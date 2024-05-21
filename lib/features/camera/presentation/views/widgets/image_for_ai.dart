import 'dart:convert';
import 'dart:io';

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
        height: MediaQuery.sizeOf(context).height * 0.35.h,
        width: MediaQuery.sizeOf(context).width * 0.8.w,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(File(base64Decode(path).toString())),
            ),
            borderRadius: BorderRadius.circular(20.w)));
  }
}
