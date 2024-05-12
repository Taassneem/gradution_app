import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/widgets/custom_shimmer.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
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
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is CategoriesSuccess) {
                  return ListView.builder(
                    itemCount: state.categoryModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListViewComponent(
                        categoryModel: state.categoryModel[index],
                      );
                    },
                  );
                } else if (state is CategoriesFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                } else {
                  return const Column(
                    children: [
                      CustomShimmer(width: 350, height: 90),
                      CustomShimmer(width: 350, height: 90),
                      CustomShimmer(width: 350, height: 90),
                      CustomShimmer(width: 350, height: 90),
                      CustomShimmer(width: 350, height: 90),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
