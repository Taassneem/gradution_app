import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

class ListViewComponent extends StatelessWidget {
  const ListViewComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: MediaQuery.sizeOf(context).height * 0.1,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: AppColor.white),
      child: ListTile(
        leading: Image.asset(AppAssets.topHome),
        title: Text(
          S.of(context).quiz,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: const Icon(Icons.add),
      ),
    );
  }
}
