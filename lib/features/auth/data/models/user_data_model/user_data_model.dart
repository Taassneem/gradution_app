import 'package:equatable/equatable.dart';

import 'user.dart';

class UserDataModel extends Equatable {
  final String? messge;
  final User? user;

  const UserDataModel({this.messge, this.user});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        messge: json['messge'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'messge': messge,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [messge, user];
}
