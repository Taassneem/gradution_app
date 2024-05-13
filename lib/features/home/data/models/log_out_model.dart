import 'package:equatable/equatable.dart';

class LogOutModel extends Equatable {
  final String? message;

  const LogOutModel({this.message});

  factory LogOutModel.fromJson(Map<String, dynamic> json) => LogOutModel(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
