import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

import 'icon_method.dart';

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
          Align(
            alignment:
                isArabic() ? Alignment.centerRight : Alignment.centerLeft,
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back)),
          ),
          Align(
              alignment: isArabic() ? Alignment.topLeft : Alignment.centerRight,
              child: Image.asset(AppAssets.chatbot)),
          BlocProvider.of<CameraCubit>(context).imageFromCamera == null
              ? BlocProvider.of<CameraCubit>(context).imageFromGallery == null
                  ? Container(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  : Container(
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(
                                BlocProvider.of<CameraCubit>(context)
                                    .imageFromGallery!
                                    .path)),
                          ),
                          borderRadius: BorderRadius.circular(20)))
              : Container(
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: FileImage(File(
                            BlocProvider.of<CameraCubit>(context)
                                .imageFromCamera!
                                .path)),
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
          const SizedBox(height: 24),
          Stack(children: [
            Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topRight,
                height: MediaQuery.sizeOf(context).height * 0.45,
                width: MediaQuery.sizeOf(context).width * 0.8,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Image.asset(AppAssets.chatbotMessage)),
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
