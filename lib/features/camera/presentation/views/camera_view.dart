import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/features/camera/presentation/manager/camera_cubit/camera_cubit.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: BlocProvider.of<CameraCubit>(context).image == null
                ? const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                  )
                : Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: FileImage(File(
                          BlocProvider.of<CameraCubit>(context).image!.path)),
                    )),
                  ),
          ),
          const SizedBox(height: 20),
          
          BlocProvider.of<CameraCubit>(context).imageBase64 == null
              ? const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50,
                )
              : Image.memory(
                  BlocProvider.of<CameraCubit>(context).imageBase64,
                  height: 200,
                )
        ],
      ),
    ));
  }
}
