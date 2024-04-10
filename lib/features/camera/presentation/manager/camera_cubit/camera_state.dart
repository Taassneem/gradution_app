part of 'camera_cubit.dart';

sealed class CameraState extends Equatable {
  const CameraState();

  @override
  List<Object> get props => [];
}

final class CameraInitial extends CameraState {}

final class CameraLoading extends CameraState {}

final class CameraSuccess extends CameraState {}

final class CameraFailure extends CameraState {
  final String errorMessage;

  const CameraFailure({required this.errorMessage});
}
final class CameraGalleryLoading extends CameraState {}

final class CameraGallerySuccess extends CameraState {}

final class CameraGalleryFailure extends CameraState {
  final String errorMessage;

  const CameraGalleryFailure({required this.errorMessage});
}
