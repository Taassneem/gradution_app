import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class NameSpeaker extends StatelessWidget {
  const NameSpeaker({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.babyBlue, borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.volume_up_outlined),
      ),
    );
  }
}
