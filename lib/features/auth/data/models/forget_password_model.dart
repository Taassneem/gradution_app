import 'package:equatable/equatable.dart';

class ForgetPasswordModel extends Equatable {
  final String? message;

  const ForgetPasswordModel({this.message});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
