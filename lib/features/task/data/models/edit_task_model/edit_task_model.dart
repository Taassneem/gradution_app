import 'package:equatable/equatable.dart';

import 'updated_blog.dart';

class EditTaskModel extends Equatable {
  final String? message;
  final UpdatedBlog? updatedBlog;

  const EditTaskModel({this.message, this.updatedBlog});

  factory EditTaskModel.fromJson(Map<String, dynamic> json) => EditTaskModel(
        message: json['message'] as String?,
        updatedBlog: json['updatedBlog'] == null
            ? null
            : UpdatedBlog.fromJson(json['updatedBlog'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'updatedBlog': updatedBlog?.toJson(),
      };

  @override
  List<Object?> get props => [message, updatedBlog];
}
