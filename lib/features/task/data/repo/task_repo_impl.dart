import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gradution_app/core/api/api_consumer.dart';
import 'package:gradution_app/core/errors/auth_failure.dart';

import 'package:gradution_app/core/errors/failure.dart';
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
    required String image,
    required String categories,
    required List<String> days,
    required String reminder,
    required String repeater,
      required DateTime date

  }) async {
    try {
      final response = await api.post(
        EndPoint.addTask,
        isFormData: true,
        data: {
          ApiKey.image: image,
          ApiKey.reminder: reminder,
          ApiKey.repeater: repeater,
          ApiKey.daysOfWeek: days,
          ApiKey.title: title,
          ApiKey.selectedActivity: categories
        },
      );
      addTaskModel = TaskModel.fromJson(response);
      return Right(addTaskModel!);
    } on DioException catch (e) {
      return Left(handelDioException(e));
    }
  }

  @override
  Future<Either<FailureString, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await api.get(EndPoint.categories);

      List<dynamic> categories = response['todos'];

      List<CategoryModel> category =
          categories.map((item) => CategoryModel.fromJson(item)).toList();
      return right(category);
    } catch (e) {
      if (e is DioException) {
        return left(FailureString.fromDioException(e));
      }
      return left(
        FailureString(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureString, List<CategoryModel>>> fetchTasks(
      {required String id}) async {
    try {
      final response = await api.get(EndPoint.getTasks(id));

      List<dynamic> categories = response['todos'];

      List<CategoryModel> category =
          categories.map((item) => CategoryModel.fromJson(item)).toList();
      return right(category);
    } catch (e) {
      if (e is DioException) {
        return left(FailureString.fromDioException(e));
      }
      return left(
        FailureString(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureString, TaskModel>> deleteTask() {
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureString, TaskModel>> updateTask() {
    throw UnimplementedError();
  }
}
