import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());
  XFile? image;
  var imageBase64;
  String? base64Image;
  pickImageWithCamera() async {
    try {
      emit(CameraLoading());

      final retunedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (retunedImage == null) return;

      image = XFile(retunedImage.path);
      List<int> imageBytes = File(image!.path).readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      imageBase64 = base64Decode(base64Image!);
      log(base64Image!);
      emit(CameraSuccess());
    } catch (e) {
      emit(CameraFailure(errorMessage: e.toString()));
    }
  }
}
