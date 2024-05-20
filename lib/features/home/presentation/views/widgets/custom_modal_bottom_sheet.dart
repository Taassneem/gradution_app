import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/camera/presentation/views/widgets/image_features.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

class CustomModalBottomSheetProfilePic extends StatelessWidget {
  const CustomModalBottomSheetProfilePic({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is PickProfileFromCameraSuccess) {
                    profileCubit.uploadProfilepic();
                    GoRouter.of(context).pop();
                  } else if (state is PickProfileFromCameraFailure) {
                    showToast(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return ImageFeatures(
                    image: AppAssets.camera,
                    type: S.of(context).takePhoto,
                    onTap: () {
                      profileCubit.pickImageWithCamera();
                    },
                  );
                },
              ),
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is PickProfileFromGallerySuccess) {
                    profileCubit.uploadProfilepic();
                    GoRouter.of(context).pop();
                  } else if (state is PickProfileFromGalleryFailure) {
                    showToast(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return ImageFeatures(
                    onTap: () {
                      profileCubit.pickImageWithGallery();
                    },
                    image: AppAssets.cloud,
                    type: S.of(context).uploadPhoto,
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
