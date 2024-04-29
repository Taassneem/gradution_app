import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/core/api/api_consumer.dart';

import 'package:gradution_app/core/errors/failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';

import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';

import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

import 'task_repo.dart';

class TaskRepoImpl extends TaskRepo {
  final ApiConsumer api;
  GlobalKey<FormState> taskKey = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController timeHour = TextEditingController();
  TextEditingController timeMin = TextEditingController();
  TaskRepoImpl({required this.api});
  @override
  Future<Either<FailureString, TaskModel>> addTask() async {
    final response =
        await api.post(EndPoint.addTask, isFormData: true, data: {
          ApiKey.time: timeMin,
          
        });
    return right(response);
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
}
