import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/calender_view_body.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink,
      body: SafeArea(
        child: CalenderViewBody(),
      ),
    );
  }
}
