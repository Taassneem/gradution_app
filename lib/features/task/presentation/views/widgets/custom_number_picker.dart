import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker({
    super.key,
    this.isHour = false,
  });

  final bool isHour;
  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  var hour = 0;
  var minute = 0;
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 0,
      maxValue: widget.isHour ? 12 : 60,
      value: widget.isHour ? hour : minute,
      textStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColor.black),
      selectedTextStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColor.purple),
      zeroPad: true,
      itemWidth: 80,
      decoration: BoxDecoration(
          color: AppColor.pink, borderRadius: BorderRadius.circular(20)),
      onChanged: widget.isHour
          ? (value) {
              setState(() {
                hour = value;
              });
            }
          : (value) {
              setState(() {
                minute = value;
              });
            },
    );
  }
}
