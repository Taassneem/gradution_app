import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/api/api_consumer.dart';
import 'package:gradution_app/core/errors/auth_failure.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.api) : super(TaskInitial());
  final ApiConsumer api;
  CategoryModel? category;
  fetchCategories() async {
    try {
      emit(CategoriesLoading());
      final response = await api.get(EndPoint.categories);
      
      List<dynamic> categories = response['todos'];
      List<CategoryModel> category =
          categories.map((item) => CategoryModel.fromJson(item)).toList();
      // category = CategoryModel.fromJson(categories);
      emit(CategoriesSuccess(categoryModel: category));
    } on ServerFailure catch (e) {
      emit(CategoriesFailure(errorMessage: e.failure.errorMessage));
    }
  }
}
