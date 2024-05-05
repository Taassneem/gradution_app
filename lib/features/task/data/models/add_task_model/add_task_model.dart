import 'package:equatable/equatable.dart';

import 'added.dart';

class AddTaskModel extends Equatable {
  final String? message;
  final Added? added;

  const AddTaskModel({this.message, this.added});

  factory AddTaskModel.fromJson(Map<String, dynamic> json) => AddTaskModel(
        message: json['message'] as String?,
        added: json['added'] == null
            ? null
            : Added.fromJson(json['added'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'added': added?.toJson(),
      };

  @override
  List<Object?> get props => [message, added];
}
