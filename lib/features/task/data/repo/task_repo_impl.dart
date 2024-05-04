import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gradution_app/core/api/api_consumer.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';

import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

import 'task_repo.dart';

class TaskRepoImpl extends TaskRepo {
  final ApiConsumer api;
  TaskRepoImpl({required this.api});

  TaskModel? addTaskModel;
  @override
  Future<Either<ServerFailure, TaskModel>> addTask({
    required String title,
    String? image,
    String? categoryTitle,
    String? categoryImage,
    required List<dynamic> days,
    required String reminder,
    required String repeater,
    required DateTime date,
    required DateTime time,
  }) async {
    try {
      final response = await api.post(
        EndPoint.addTask,
        isFormData: true,
        data: {
          ApiKey.image: image ?? categoryImage,
          ApiKey.reminder: reminder,
          ApiKey.repeater: repeater,
          ApiKey.daysOfWeek: days,
          ApiKey.title: title,
          ApiKey.selectedActivity: categoryTitle,
          ApiKey.date: date,
          ApiKey.time: time,
        },
      );
      addTaskModel = TaskModel.fromJson(response);
      return Right(addTaskModel!);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await api.get(EndPoint.categories);

      List<dynamic> categories = response['todos'];

      List<CategoryModel> category =
          categories.map((item) => CategoryModel.fromJson(item)).toList();
      return right(category);
    } on DioException catch (e) {
      return left(handelDioException(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<CategoryModel>>> fetchTasks(
      {required String id}) async {
    try {
      final response = await api.get(EndPoint.getTasks(id));

      List<dynamic> categories = response['todos'];

      List<CategoryModel> category =
          categories.map((item) => CategoryModel.fromJson(item)).toList();
      return right(category);
    } on DioException catch (e) {
      return left(handelDioException(e));
    }
  }

  @override
  Future<Either<ServerFailure, TaskModel>> deleteTask() {
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailure, TaskModel>> updateTask() {
    throw UnimplementedError();
  }
}
