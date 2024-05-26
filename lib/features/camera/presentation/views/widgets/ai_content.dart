import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/flutter_tts.dart';
import 'package:gradution_app/core/utils/translator.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

import 'icon_method.dart';

class AiContent extends StatefulWidget {
  const AiContent({super.key});

  @override
  State<AiContent> createState() => _AiContentState();
}

class _AiContentState extends State<AiContent> {
  final FlutterTtsMe flutterTtsMe = FlutterTtsMe();

  final Translator googleTranslator = Translator();
  String translatedText = "";

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
                  padding: isArabic()
                      ? EdgeInsets.only(right: 24.r, top: 24.r)
                      : EdgeInsets.only(left: 24.r, top: 24.r),
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30.w),
                  ),
                  child: ListView.builder(
                    itemCount: state.model.classNames!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Text('${index + 1}. '),
                          Text(
                            state.model.classNames![index],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                if (translatedText.isNotEmpty)
                  Positioned(
                    bottom: 60, // Adjust as needed
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        translatedText,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 1,
                  left: 1,
                  right: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconMethod(
                          icon: Icons.volume_up,
                          rightIcon: isArabic() ? true : false,
                          onTap: () {
                            log('message');
                            isArabic()
                                ? flutterTtsMe.speakText(
                                    state.model.classNames!.toString(), 'ar-SA')
                                : flutterTtsMe.speakText(
                                    state.model.classNames!.toString(),
                                    'en-US');
                          }),
                      IconMethod(
                        icon: Icons.translate,
                        rightIcon: !isArabic(),
                        onTap: isArabic()
                            ? () async {
                                String translation =
                                    await googleTranslator.translate(
                                  text: state.model.classNames!.toString(),
                                  langTo: 'en',
                                  langFrom: 'ar',
                                );
                                setState(() {
                                  translatedText = translation;
                                });
                              }
                            : () async {
                                String translation =
                                    await googleTranslator.translate(
                                  text: state.model.classNames!.toString(),
                                  langTo: 'ar',
                                  langFrom: 'en',
                                );
                                setState(() {
                                  translatedText = translation;
                                });
                              },
                      ),
                    ],
                  ),
                ),
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
