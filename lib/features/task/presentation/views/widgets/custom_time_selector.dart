// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CustomTimeSelector extends StatefulWidget {
  CustomTimeSelector({
    super.key,
    required this.time,
    this.isSelected = false,
  });
  final String time;
  bool isSelected;

  @override
  State<CustomTimeSelector> createState() => _CustomTimeSelectorState();
}

class _CustomTimeSelectorState extends State<CustomTimeSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   widget.isSelected = true;
        // });
      },
      child: Container(
        width: 80,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.pink, width: 1.5),
            color: widget.isSelected ? AppColor.pink : AppColor.white),
        child: Text(widget.time, style: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }
}
