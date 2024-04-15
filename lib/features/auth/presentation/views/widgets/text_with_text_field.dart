import 'package:flutter/material.dart';
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
  });
  final String textFieldName;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final bool userProfile;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          userProfile: userProfile,
          hintText: hintText,
          icon: icon,
          obscureText: obscureText,
          controller: controller,
        ),
      ],
    );
  }
}
