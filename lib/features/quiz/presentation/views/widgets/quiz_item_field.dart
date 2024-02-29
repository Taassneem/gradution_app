import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class QuizItemField extends StatelessWidget {
  const QuizItemField({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.left,
    this.paddingLeft = 0,
  });
  final String image;
  final String title;
  final Function()? onTap;
  final double? left;
  final double paddingLeft;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16, left: paddingLeft),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 180,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    border: const Border(
                        top: BorderSide(color: AppColor.babyBlue, width: 2),
                        left: BorderSide(color: AppColor.babyBlue, width: 2),
                        right: BorderSide(color: AppColor.babyBlue, width: 2),
                        bottom: BorderSide(color: AppColor.babyBlue, width: 2)),
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(image),
              ),
              Positioned(
                bottom: -3,
                left: left,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColor.babyBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(title)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
