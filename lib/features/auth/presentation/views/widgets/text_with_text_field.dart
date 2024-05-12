import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/features/auth/presentation/views/widgets/custom_text_field.dart';

class TextWithTextField extends StatelessWidget {
  const TextWithTextField({
    super.key,
    required this.textFieldName,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.userProfile = false,
    this.finalField = false,
    this.isPassword = false,
  });
  final String textFieldName;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final bool userProfile;
  final TextEditingController? controller;
  final bool finalField;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 10.h),
        CustomTextFormField(
          userProfile: userProfile,
          hintText: hintText,
          icon: icon,
          obscureText: obscureText,
          controller: controller,
          finalField: finalField,
          isPassword: isPassword,
        ),
      ],
    );
  }
}
