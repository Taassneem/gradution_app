import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
  });
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: (widget.obscureText && obscureText),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      cursorColor: AppColor.lightGrey,
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          border: outlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColor.lightGrey),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText
                      ? const Icon(Icons.remove_red_eye_outlined)
                      : const Icon(Icons.visibility_off_outlined))
              : Icon(widget.icon)),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.purple),
      borderRadius: BorderRadius.circular(30),
    );
  }
}
