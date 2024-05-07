import 'dart:io';

import 'package:flutter/material.dart';

class ImageForAi extends StatelessWidget {
  const ImageForAi({
    super.key,
    required this.path,
  });
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.35,
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(File(path)),
            ),
            borderRadius: BorderRadius.circular(20)));
  }
}
