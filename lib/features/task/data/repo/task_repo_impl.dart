import 'package:dartz/dartz.dart';
import 'package:gradution_app/core/api/api_consumer.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';

import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/models/add_task_model/add_task_model.dart';
import 'package:gradution_app/features/task/data/models/delete_task_model.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

import 'task_repo.dart';

class TaskRepoImpl extends TaskRepo {
  final ApiConsumer api;
  TaskRepoImpl({required this.api});

  AddTaskModel? addTaskModel;
  @override
  Future<Either<ServerFailure, AddTaskModel>> addTask({
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
      addTaskModel = AddTaskModel.fromJson(response);
      getIt
          .get<CacheHelper>()
          .saveData(key: ApiKey.taskId, value: addTaskModel!.added!.id);
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
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<TaskModel>>> fetchTasks() async {
    try {
      final response = await api.get(EndPoint.getTasks(
          getIt.get<CacheHelper>().getData(key: ApiKey.loginId)));
      List<dynamic> tasks = response['blogs'];
      List<TaskModel> task =
          tasks.map((item) => TaskModel.fromJson(item)).toList();
      return right(task);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, DeleteTaskModel>> deleteTask() async {
    try {
      final response = await api.delete(EndPoint.deteleTask(
          getIt.get<CacheHelper>().getData(key: ApiKey.taskId)));
      DeleteTaskModel model = DeleteTaskModel.fromJson(response);
      return right(model);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, AddTaskModel>> editTask() {
    throw UnimplementedError();
  }
}
