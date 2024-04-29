import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/errors/failure.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

abstract class TaskRepo {
  Future<Either<FailureString, List<CategoryModel>>> fetchCategories();
  Future<Either<FailureString, TaskModel>> addTask();

}
