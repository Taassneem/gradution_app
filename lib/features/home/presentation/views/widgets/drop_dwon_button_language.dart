import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class CustomLangDropDownButton extends StatefulWidget {
  const CustomLangDropDownButton({
    super.key,
  });

  @override
  State<CustomLangDropDownButton> createState() =>
      _CustomLangDropDownButtonState();
}

class _CustomLangDropDownButtonState extends State<CustomLangDropDownButton> {
  String firstValue = S.current.english;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: AppColor.purple,
      style: Theme.of(context).textTheme.titleSmall,
      value: firstValue,
      onChanged: (String? value) {
        setState(() {
          firstValue = value!;
        });
      },
      icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
      underline: const SizedBox.shrink(),
      items: [
        DropdownMenuItem(
            onTap: () {
              BlocProvider.of<GlobalCubit>(context).english();
            },
            value: S.of(context).english,
            child: Text(S.of(context).english)),
        DropdownMenuItem(
            onTap: () {
              BlocProvider.of<GlobalCubit>(context).arabic();
            },
            value: S.of(context).arabic,
            child: Text(S.of(context).arabic)),
      ],
    );
  }
}
