import 'package:equatable/equatable.dart';

class CameraModel extends Equatable {
  final List<dynamic>? classNames;
  final String? imageData;

  const CameraModel({this.classNames, this.imageData});

  factory CameraModel.fromJson(Map<String, dynamic> json) => CameraModel(
        classNames: json['class_names'] as List<dynamic>,
        imageData: json['image_data'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'class_names': classNames,
        'image_data': imageData,
      };

  @override
  List<Object?> get props => [classNames, imageData];
}
