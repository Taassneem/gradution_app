part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

final class CategoriesLoading extends TaskState {}

final class CategoriesSuccess extends TaskState {
  final List<CategoryModel> categoryModel;

  const CategoriesSuccess({required this.categoryModel});
}

final class CategoriesFailure extends TaskState {
  final String errorMessage;

  const CategoriesFailure({required this.errorMessage});
}
