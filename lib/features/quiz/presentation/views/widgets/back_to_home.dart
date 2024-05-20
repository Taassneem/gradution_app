import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';

class BackToHome extends StatelessWidget {
  const BackToHome({
    super.key,
    this.isWhite = false,
  });
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement(AppRouter.quizView);
      },
      child: Align(
        alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 70.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: isWhite ? AppColor.white : AppColor.babyBlue,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 8),
              Icon(Icons.home_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
