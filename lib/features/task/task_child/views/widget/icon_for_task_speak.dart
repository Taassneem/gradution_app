import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/flutter_tts.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

class IconSpeakForTask extends StatelessWidget {
  IconSpeakForTask({
    super.key,
    required this.taskModel,
  });
  final FlutterTtsMe flutterTtsMe = FlutterTtsMe();

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('Speak For Task');
        isArabic()
            ? flutterTtsMe.speakText(taskModel.selectedActivity!, 'ar-SA')
            : flutterTtsMe.speakText(taskModel.selectedActivity!, 'en-US');
      },
      child: Container(
        width: 125.w,
        height: 88.h,
        decoration: BoxDecoration(
            color: AppColor.pink, borderRadius: BorderRadius.circular(15)),
        child: const Icon(Icons.volume_up),
      ),
    );
  }
}
