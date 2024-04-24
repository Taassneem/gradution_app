import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'list_view_component.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          ListTile(
            title: Text(S.of(context).categories,
                style: Theme.of(context).textTheme.titleMedium),
            trailing: Image.asset(AppAssets.categories),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ListViewComponent();
              },
            ),
          ),
        ],
      ),
    );
  }
}
