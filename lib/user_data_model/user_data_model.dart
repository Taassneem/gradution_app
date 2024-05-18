import 'package:equatable/equatable.dart';

import 'user.dart';

class UserDataModel extends Equatable {
  final String? message;
  final User? user;

  const UserDataModel({this.message, this.user});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [message, user];
}
