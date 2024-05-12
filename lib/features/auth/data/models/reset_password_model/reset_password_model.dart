import 'package:equatable/equatable.dart';

import 'reseted_pass_data.dart';

class ResetPasswordModel extends Equatable {
  final String? message;
  final ResetedPassData? resetedPassData;

  const ResetPasswordModel({this.message, this.resetedPassData});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      message: json['message'] as String?,
      resetedPassData: json['resetedPassData'] == null
          ? null
          : ResetedPassData.fromJson(
              json['resetedPassData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'resetedPassData': resetedPassData?.toJson(),
      };

  @override
  List<Object?> get props => [message, resetedPassData];
}
