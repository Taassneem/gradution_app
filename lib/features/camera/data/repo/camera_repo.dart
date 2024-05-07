import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/features/camera/data/models/camera_model.dart';

abstract class CameraRepo {
  Future<Either<ServerFailure, CameraModel>> sendPhoto({required String image});
}
