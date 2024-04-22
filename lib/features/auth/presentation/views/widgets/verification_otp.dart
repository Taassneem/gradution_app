import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:pinput/pinput.dart';

class VerificationOTP extends StatelessWidget {
  const VerificationOTP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme(context),
      focusedPinTheme: defaultPinTheme(context),
    );
  }

  PinTheme defaultPinTheme(BuildContext context) {
    return PinTheme(
        height: 80,
        width: 70,
        margin: const EdgeInsets.all(2),
        textStyle: Theme.of(context).textTheme.titleLarge,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: AppColor.purple,
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 20))
            ]));
  }
}
