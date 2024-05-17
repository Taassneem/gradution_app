import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.userProfile = false,
    this.finalField = false,
    this.isPassword = false,
  });
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final bool userProfile;
  final bool finalField;
  final bool isPassword;

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
          widget.isPassword
              ? S.of(context).passwordValidate
              : S.of(context).emailValidate;
        }
        return null;
      },
      textInputAction:
          widget.finalField ? TextInputAction.done : TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColor.lightGrey,
      decoration: InputDecoration(
          fillColor: AppColor.white,
          filled: true,
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          border: outlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: widget.userProfile ? AppColor.black : AppColor.lightGrey),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.remove_red_eye_outlined))
              : Icon(widget.icon)),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.purple, width: 1.5.w),
      borderRadius: BorderRadius.circular(30.w),
    );
  }
}
