import 'package:equatable/equatable.dart';

class SavedUser extends Equatable {
  final String? userName;
  final String? email;
  final String? password;
  final bool? isConfirmed;
  final String? role;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const SavedUser({
    this.userName,
    this.email,
    this.password,
    this.isConfirmed,
    this.role,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SavedUser.fromJson(Map<String, dynamic> json) => SavedUser(
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        isConfirmed: json['isConfirmed'] as bool?,
        role: json['role'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'password': password,
        'isConfirmed': isConfirmed,
        'role': role,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      userName,
      email,
      password,
      isConfirmed,
      role,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
