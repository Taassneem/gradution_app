import 'package:equatable/equatable.dart';

class DeleteUserModel extends Equatable {
  final String? message;

  const DeleteUserModel({this.message});

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) {
    return DeleteUserModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
