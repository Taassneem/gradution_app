// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/features/camera/data/models/camera_model.dart';
import 'package:gradution_app/features/camera/data/repo/camera_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit(this.cameraRepo) : super(CameraInitial());
  XFile? imageFromGallery;
  XFile? imageFromCamera;
  var imageBase64FromCamera;
  String? base64ImageFromCamera;
  var imageBase64FromGallery;
  String? base64ImageFromGallery;
  final CameraRepo cameraRepo;

  pickImageWithGallery() async {
    try {
      emit(CameraGalleryLoading());

      final retunedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (retunedImage == null) return;

      imageFromGallery = XFile(retunedImage.path);
      List<int> imageBytes = File(imageFromGallery!.path).readAsBytesSync();
      base64ImageFromGallery = base64Encode(imageBytes);
      // imageBase64FromGallery = base64Decode(base64ImageFromGallery!);
      log(base64ImageFromGallery!);
      emit(CameraGallerySuccess());
    } catch (e) {
      emit(CameraGalleryFailure(errorMessage: e.toString()));
    }
  }

  pickImageWithCamera() async {
    try {
      emit(CameraLoading());

      final retunedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (retunedImage == null) return;

      imageFromCamera = XFile(retunedImage.path);
      List<int> imageBytes = File(imageFromCamera!.path).readAsBytesSync();
      base64ImageFromCamera = base64Encode(imageBytes);
      // imageBase64FromCamera = base64Decode(base64ImageFromCamera!);
      log(imageBase64FromCamera!);
      emit(CameraSuccess());
    } catch (e) {
      emit(CameraFailure(errorMessage: e.toString()));
    }
  }

  Future<void> sendPhoto() async {
    emit(SendPhotoLoading());
    var result = await cameraRepo.sendPhoto(
        image: base64ImageFromCamera ?? base64ImageFromGallery!);
    result.fold(
        (failure) =>
            emit(SendPhotoFailure(errorMessage: failure.failure.errorMessage)),
        (photo) => emit(SendPhotoSuccess(model: photo)));
  }
}
