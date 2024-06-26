import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/flutter_tts.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

import 'icon_method.dart';

class AiContent extends StatelessWidget {
  AiContent({super.key});
  final FlutterTtsMe flutterTtsMe = FlutterTtsMe();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        height: MediaQuery.sizeOf(context).height * 0.45.h,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(30.w),
        ),
        child: BlocBuilder<CameraCubit, CameraState>(
          builder: (context, state) {
            if (state is SendPhotoSuccess) {
              return Stack(clipBehavior: Clip.none, children: [
                Container(
                  padding: EdgeInsets.only(left: 24.r, top: 24.r),
                  alignment: Alignment.topRight,
                  height: MediaQuery.sizeOf(context).height * 0.35.h,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  child: ListView.builder(
                    itemCount: state.model.classNames!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          isArabic()
                              ? const SizedBox.shrink()
                              : Text('${index + 1}.'),
                          Text(state.model.classNames![index]),
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: -75,
                  right: 1.w,
                  left: 1.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconMethod(
                          icon: Icons.volume_up,
                          rightIcon: isArabic() ? true : false,
                          onTap: () {
                            log('message');
                            flutterTtsMe
                                .speakText(state.model.classNames!.toString());
                          }),
                      IconMethod(
                        icon: Icons.translate,
                        rightIcon: isArabic() ? false : true,
                        onTap: () {
                          isArabic()
                              ? BlocProvider.of<GlobalCubit>(context).english()
                              : BlocProvider.of<GlobalCubit>(context).arabic();
                        },
                      ),
                    ],
                  ),
                )
              ]);
            } else if (state is SendPhotoFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(AppAssets.chatbotMessage),
              );
            }
          },
        ));
  }
}
