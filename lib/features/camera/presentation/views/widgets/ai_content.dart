import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

import 'icon_method.dart';

class AiContent extends StatelessWidget {
  AiContent({
    super.key,
  });
  final FlutterTts flutterTts = FlutterTts();
  speak(String text, BuildContext context) async {
    await flutterTts
        .setLanguage(BlocProvider.of<GlobalCubit>(context).langCode);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.r),
        alignment: Alignment.topRight,
        height: MediaQuery.sizeOf(context).height * 0.45.h,
        width: MediaQuery.sizeOf(context).width * 0.8.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(30.w),
        ),
        child: Column(
          children: [
            BlocBuilder<CameraCubit, CameraState>(
              builder: (context, state) {
                if (state is SendPhotoSuccess) {
                  return Stack(children: [
                    Container(
                      padding: EdgeInsets.all(16.r),
                      alignment: Alignment.topRight,
                      height: MediaQuery.sizeOf(context).height * 0.45.h,
                      width: MediaQuery.sizeOf(context).width * 0.8.w,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(30.w),
                      ),
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: state.model.classNames!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Text('${index + 1}.'),
                                Text(state.model.classNames![index]),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2.h,
                      right: 1.w,
                      left: 1.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconMethod(
                            icon: Icons.volume_off,
                            rightIcon: isArabic() ? true : false,
                            onTap: () => speak(
                                state.model.classNames!.toString(), context),
                          ),
                          IconMethod(
                            icon: Icons.translate,
                            rightIcon: isArabic() ? false : true,
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
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                } else {
                  return Image.asset(AppAssets.chatbotMessage);
                }
              },
            ),
          ],
        ));
  }
}
