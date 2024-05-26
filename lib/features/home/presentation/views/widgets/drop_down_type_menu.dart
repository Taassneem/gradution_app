import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

class CustomTypeDropDownButton extends StatefulWidget {
  const CustomTypeDropDownButton({
    super.key,
  });

  @override
  State<CustomTypeDropDownButton> createState() =>
      _CustomTypeDropDownButtonState();
}

class _CustomTypeDropDownButtonState extends State<CustomTypeDropDownButton> {
  String typeValue = 'child';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: AppColor.purple,
      style: Theme.of(context).textTheme.titleSmall,
      value: typeValue,
      onChanged: (String? value) {
        setState(() {
          typeValue = value!;
        });
      },
      icon: const Icon(Icons.keyboard_double_arrow_down_rounded),
      underline: const SizedBox.shrink(),
      items: [
        DropdownMenuItem(
            onTap: () {
              BlocProvider.of<ProfileCubit>(context).getUserData();
              GoRouter.of(context).pushReplacement(AppRouter.baseView);
            },
            value: 'child',
            child: Text(S.of(context).child)),
        DropdownMenuItem(
            onTap: () {
              BlocProvider.of<ProfileCubit>(context).getUserData();
              GoRouter.of(context).pushReplacement(AppRouter.taskView);
            },
            value: 'parent',
            child: Text(S.of(context).parent)),
      ],
    );
  }
}
