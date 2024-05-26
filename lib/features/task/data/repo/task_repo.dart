import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/models/add_task_model/add_task_model.dart';
import 'package:gradution_app/features/task/data/models/delete_task_model.dart';
import 'package:gradution_app/features/task/data/models/edit_task_model/edit_task_model.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

abstract class TaskRepo {
  Future<Either<ServerFailure, List<CategoryModel>>> fetchCategories();
  Future<Either<ServerFailure, List<TaskModel>>> fetchTasks();
  Future<Either<ServerFailure, AddTaskModel>> addTask({
    required String title,
    String? categoryTitle,
    required String categoryImage,
    required List<dynamic> days,
    required String reminder,
    required String repeater,
    required DateTime date,
    required DateTime time,
  });
  Future<Either<ServerFailure, EditTaskModel>> editTask({
    required String title,
    String? categoryTitle,
    String? categoryImage,
    required List<dynamic> days,
    required String reminder,
    required String repeater,
    required DateTime time,
    required String id,
  });
  Future<Either<ServerFailure, DeleteTaskModel>> deleteTask(
      {required String id});
}
