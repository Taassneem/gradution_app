import 'package:equatable/equatable.dart';

import 'user_updated.dart';

class SignInModel extends Equatable {
  final String? message;
  final UserUpdated? userUpdated;

  const SignInModel({this.message, this.userUpdated});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: json['message'] as String?,
        userUpdated: json['userUpdated'] == null
            ? null
            : UserUpdated.fromJson(json['userUpdated'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'userUpdated': userUpdated?.toJson(),
      };

  @override
  List<Object?> get props => [message, userUpdated];
}
