import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/widgets/custom_shimmer.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'list_view_component.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({
    super.key,
    this.isEditTask = false,
  });
  final bool isEditTask;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w),
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
                      return CategoryListViewComponent(
                        isEditTask: isEditTask,
                        categoryModel: state.categoryModel[index],
                      );
                    },
                  );
                } else if (state is CategoriesFailure) {
                  return showToast(state.errorMessage, task: true);
                } else {
                  return const Column(
                    children: [
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
