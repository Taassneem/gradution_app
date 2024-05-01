import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/errors/auth_failure.dart';
import 'package:gradution_app/core/errors/failure.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

abstract class TaskRepo {
  Future<Either<FailureString, List<CategoryModel>>> fetchCategories();
  Future<Either<FailureString, List<CategoryModel>>> fetchTasks(
      {required String id});
  Future<Either<ServerFailure, TaskModel>> addTask({
    required String title,
    required String image,
    required String categories,
    required List<String> days,
    required String reminder,
    required String repeater,
    required DateTime date
  });
  Future<Either<FailureString, TaskModel>> updateTask();
  Future<Either<FailureString, TaskModel>> deleteTask();
}
