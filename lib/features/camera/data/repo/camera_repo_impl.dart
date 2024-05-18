import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/api/api_consumer.dart';

import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/features/camera/data/models/camera_model.dart';

import 'camera_repo.dart';

class CameraRepoImpl extends CameraRepo {
  final ApiConsumer api;

  CameraRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, CameraModel>> sendPhoto(
      {required String image}) async {
    try {
      final response = await api.post(
        EndPoint.modelAi,
        data: {ApiKey.imageAi: image},
      );
      log("Sending request with image data: $image");

      // if (response == null || response.data == null) {
      //   log('No response from server');
      // }
      final photo = CameraModel.fromJson(response);
      log(photo.classNames.toString());
      return right(photo);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
