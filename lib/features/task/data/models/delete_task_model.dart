class DeleteTaskModel {
  final String message;

  DeleteTaskModel({required this.message});
  factory DeleteTaskModel.fromJson(Map<String, dynamic> json) =>
      DeleteTaskModel(message: json['message']);
}
