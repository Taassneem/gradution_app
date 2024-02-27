import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class ChoosenType extends StatelessWidget {
  const ChoosenType({
    super.key,
    this.onTap,
    required this.image,
    required this.type,
  });
  final Function()? onTap;
  final String image;
  final String type;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                    bottom: BorderSide(color: AppColor.purple),
                    top: BorderSide(color: AppColor.purple),
                    left: BorderSide(color: AppColor.purple),
                    right: BorderSide(color: AppColor.purple)),
                borderRadius: BorderRadius.circular(100)),
            child: Image.asset(image),
          ),
          const SizedBox(height: 24),
          Text(type, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
