import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

import 'ai_content.dart';
import 'arrow_back.dart';
import 'empty_image.dart';
import 'icon_method.dart';
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
          const SizedBox(height: 5),
          const ArrowBack(),
          Align(
              alignment: isArabic() ? Alignment.topLeft : Alignment.centerRight,
              child: Image.asset(AppAssets.chatbot)),
          BlocProvider.of<CameraCubit>(context).imageFromCamera == null
              ? BlocProvider.of<CameraCubit>(context).imageFromGallery == null
                  ? const EmptyImage()
                  : ImageForAi(
                      path: BlocProvider.of<CameraCubit>(context)
                          .imageFromGallery!
                          .path)
              : ImageForAi(
                  path: BlocProvider.of<CameraCubit>(context)
                      .imageFromCamera!
                      .path),
          const SizedBox(height: 24),
          Stack(children: [
            const AiContent(),
            Positioned(
              bottom: 2,
              right: 1,
              left: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconMethod(
                    icon: Icons.volume_off,
                    rightIcon: isArabic() ? true : false,
                  ),
                  IconMethod(
                    icon: Icons.translate,
                    rightIcon: isArabic() ? false : true,
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
