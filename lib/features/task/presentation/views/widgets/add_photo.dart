import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/func/custom_snack_bar.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
import 'package:gradution_app/features/task/presentation/views/widgets/task_elevated_button.dart';
import 'package:gradution_app/generated/l10n.dart';

import '../../../../splash/presentation/views/widget/custom_ok_elevated_button.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Card(
          color: AppColor.pink,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(S.of(context).addPhoto,
                      style: Theme.of(context).textTheme.titleMedium),
                  trailing: Image.asset(AppAssets.addPhoto),
                ),
                BlocProvider.of<TaskCubit>(context).taskImageFromCamera == null
                    ? Container(
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(AppAssets.addPhoto))
                    : Container(
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(
                                  BlocProvider.of<TaskCubit>(context)
                                      .taskImageFromCamera!
                                      .path)),
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                const SizedBox(height: 24),
                BlocConsumer<TaskCubit, TaskState>(
                  listener: (context, state) {
                    if (state is UploadingPhotoSuccess) {
                      showSnackBar(context,
                          content: Text(S.of(context).photoUploadSuccessfully));
                      BlocProvider.of<TaskCubit>(context).image =
                          BlocProvider.of<TaskCubit>(context)
                              .taskImageFromCamera!
                              .path;
                    } else if (state is UploadingPhotoFailure) {
                      log(state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return TaskElevatedButton(
                      upload: true,
                      isWhite: true,
                      onPressed: () {
                        BlocProvider.of<TaskCubit>(context)
                            .pickImageWithGallery();
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),
                CustomOkElevatedButton(onPressed: () {
                  Navigator.pop(context);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
