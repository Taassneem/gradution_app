import 'package:equatable/equatable.dart';

import 'todo.dart';

class CategoryModel extends Equatable {
  final List<Todo>? todos;

  const CategoryModel({this.todos});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        todos: (json['todos'] as List<dynamic>?)
            ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'todos': todos?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [todos];
}
