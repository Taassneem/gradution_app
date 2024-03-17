import 'package:equatable/equatable.dart';

import 'user_updated.dart';

class SignInModel extends Equatable {
  final String? messge;
  final UserUpdated? userUpdated;

  const SignInModel({this.messge, this.userUpdated});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        messge: json['messge'] as String?,
        userUpdated: json['userUpdated'] == null
            ? null
            : UserUpdated.fromJson(json['userUpdated'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'messge': messge,
        'userUpdated': userUpdated?.toJson(),
      };

  @override
  List<Object?> get props => [messge, userUpdated];
}
