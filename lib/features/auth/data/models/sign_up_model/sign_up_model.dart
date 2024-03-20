import 'package:equatable/equatable.dart';

import 'saved_user.dart';

class SignUpModel extends Equatable {
  final String? message;
  final SavedUser? savedUser;
  final String? token;

  const SignUpModel({this.token, this.message, this.savedUser});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        message: json['message'] as String?,
        token: json['token'] as String?,
        savedUser: json['savedUser'] == null
            ? null
            : SavedUser.fromJson(json['savedUser'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'savedUser': savedUser?.toJson(),
      };

  @override
  List<Object?> get props => [message, savedUser, token];
}
