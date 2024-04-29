import 'package:flutter/material.dart';
import 'package:gradution_app/core/common/common_lists.dart';
import 'package:gradution_app/core/utils/app_color.dart';

import 'custom_divider.dart';

class RepeaterListView extends StatefulWidget {
  const RepeaterListView({
    super.key,
  });

  @override
  State<RepeaterListView> createState() => _RepeaterListViewState();
}

class _RepeaterListViewState extends State<RepeaterListView> {
  String? selectedRepeater;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.white, width: 1.5),
          borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const CustomDivider();
          },
          itemCount: repeater.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile<String>(
              value: repeater[index],
              groupValue: selectedRepeater,
              activeColor: AppColor.divider,
              onChanged: (value) {
                setState(() {
                  selectedRepeater = value;
                });
              },
              title: Text(repeater[index],
                  style: Theme.of(context).textTheme.titleSmall),
            );
          },
        ),
      ),
    );
  }
}
