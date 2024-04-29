import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/repo/task_repo.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepo) : super(TaskInitial());
  final TaskRepo taskRepo;
  Future<void> fetchCategories() async {
    var result = await taskRepo.fetchCategories();
    result.fold(
        (failure) =>
            emit(CategoriesFailure(errorMessage: failure.errorMessage)),
        (category) => emit(CategoriesSuccess(categoryModel: category)));
  }
}
