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
  Future<Either<FailureString, TaskModel>> addTask({
    required String title,
    String? image,
    String? categoryTitle,
    String? categoryImage,
    required List<String> days,
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
  Future<Either<ServerFailure, TaskModel>> updateTask() {
    throw UnimplementedError();
  }
}
