import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';
import 'package:gradution_app/features/camera/presentation/views/camera_view.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'item_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.topHome),
          ],
        ),
        Container(
          width: 375,
          decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(color: AppColor.purple, width: 2),
              ),
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.only(top: 55.0, left: 12, right: 12),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  BlocConsumer<CameraCubit, CameraState>(
                    listener: (context, state) {
                      if (state is CameraSuccess) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CameraView(),
                            ));
                      } else if (state is CameraFailure) {
                        log(state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      return ItemField(
                        onTap: () {
                          BlocProvider.of<CameraCubit>(context)
                              .pickImageWithCamera();
                        },
                        color: AppColor.purple,
                        fieldName: S.of(context).camera,
                        image: AppAssets.camera,
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      ItemField(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.quizView);
                        },
                        color: AppColor.babyBlue,
                        fieldName: S.of(context).quiz,
                        image: AppAssets.quiz,
                        height: 170,
                      ),
                      const SizedBox(height: 16),
                      ItemField(
                        onTap: () {},
                        color: AppColor.pink,
                        fieldName: S.of(context).task,
                        image: AppAssets.task,
                        height: 180,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
