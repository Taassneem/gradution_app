import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/app_color.dart';

class CustomDropDwonButton extends StatefulWidget {
  const CustomDropDwonButton({
    super.key,
  });

  @override
  State<CustomDropDwonButton> createState() => _CustomDropDwonButtonState();
}

class _CustomDropDwonButtonState extends State<CustomDropDwonButton> {
  String firstValue = 'English';

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
            value: 'English',
            child: const Text('English')),
        DropdownMenuItem(
            onTap: () {
              BlocProvider.of<GlobalCubit>(context).arabic();
            },
            value: 'Arabic',
            child: const Text('Arabic')),
      ],
    );
  }
}
