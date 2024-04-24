import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String? id;
  final String? title;
  final bool? autoAdd;
  final String? autoImage;

  const Todo({this.id, this.title, this.autoAdd, this.autoImage});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] as String?,
        title: json['title'] as String?,
        autoAdd: json['autoAdd'] as bool?,
        autoImage: json['autoImage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'autoAdd': autoAdd,
        'autoImage': autoImage,
      };

  @override
  List<Object?> get props => [id, title, autoAdd, autoImage];
}
