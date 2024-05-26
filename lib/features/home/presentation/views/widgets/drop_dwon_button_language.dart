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
  String langValue = 'english';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: AppColor.purple,
      style: Theme.of(context).textTheme.titleSmall,
      value: langValue,
      onChanged: (String? value) {
        setState(() {
          langValue = value!;
        });
      },
      icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
      underline: const SizedBox.shrink(),
      items: [
        DropdownMenuItem(
            onTap: () {
              BlocProvider.of<GlobalCubit>(context).toggleLanguage('en');
              BlocProvider.of<GlobalCubit>(context).getLang();
            },
            value: 'english',
            child: Text(S.of(context).english,
                style: Theme.of(context).textTheme.titleSmall)),
        DropdownMenuItem(
            onTap: () {
              BlocProvider.of<GlobalCubit>(context).toggleLanguage('ar');
              BlocProvider.of<GlobalCubit>(context).getLang();
            },
            value: 'arabic',
            child: Text(S.of(context).arabic,
                style: Theme.of(context).textTheme.titleSmall)),
      ],
    );
  }
}
