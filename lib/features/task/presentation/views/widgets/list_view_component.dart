import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';

class ListViewComponent extends StatelessWidget {
  const ListViewComponent({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 16.h),
      height: MediaQuery.sizeOf(context).height * 0.1.h,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: AppColor.white),
      child: ListTile(
        onTap: () {
          BlocProvider.of<TaskCubit>(context).categoryTitle =
              categoryModel.title;
          BlocProvider.of<TaskCubit>(context).categoryImage =
              categoryModel.image;
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Category Selected')));
        },
        leading: AspectRatio(
          aspectRatio: 2.3.r,
          child: CachedNetworkImage(
            imageUrl: categoryModel.image,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColor.black)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: const Icon(Icons.add),
      ),
    );
  }
}
