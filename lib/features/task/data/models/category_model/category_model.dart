import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String title;
  final String image;

  const CategoryModel({required this.title, required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      image: json['autoImage'],
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
