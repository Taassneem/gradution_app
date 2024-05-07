import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

class AiContent extends StatelessWidget {
  const AiContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topRight,
        height: MediaQuery.sizeOf(context).height * 0.45,
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            BlocBuilder<CameraCubit, CameraState>(
              builder: (context, state) {
                if (state is SendPhotoSuccess) {
                  return Expanded(
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
                  );
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
