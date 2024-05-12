import 'package:equatable/equatable.dart';

class ResetedPassData extends Equatable {
  final String? id;
  final String? userName;
  final String? email;
  final String? password;
  final bool? isConfirmed;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? token;
  final dynamic forgetCode;

  const ResetedPassData({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.isConfirmed,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.forgetCode,
  });

  factory ResetedPassData.fromJson(Map<String, dynamic> json) {
    return ResetedPassData(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      isConfirmed: json['isConfirmed'] as bool?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      token: json['token'] as String?,
      forgetCode: json['forgetCode'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userName': userName,
        'email': email,
        'password': password,
        'isConfirmed': isConfirmed,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'token': token,
        'forgetCode': forgetCode,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userName,
      email,
      password,
      isConfirmed,
      role,
      createdAt,
      updatedAt,
      v,
      token,
      forgetCode,
    ];
  }
}
