import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

import 'ai_content.dart';
import 'arrow_back.dart';
import 'empty_image.dart';
import 'image_for_ai.dart';

class PhotoInforamtionViewBody extends StatelessWidget {
  const PhotoInforamtionViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ArrowBack(),
              Image.asset(AppAssets.chatbot),
            ],
          )),
          BlocBuilder<CameraCubit, CameraState>(
            builder: (context, state) {
              if (state is SendPhotoSuccess) {
                return ImageForAi(path: state.model.imageData!);
              } else if (state is SendPhotoFailure) {
                return showToast(state.errorMessage);
              } else {
                return const EmptyImage();
              }
            },
          ),
          SizedBox(height: 16.h),
         const AiContent(),
        ],
      ),
    );
  }
}
