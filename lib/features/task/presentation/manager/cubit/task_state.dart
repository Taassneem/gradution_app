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

final class AddTaskLoading extends TaskState {}

final class AddTaskSuccess extends TaskState {
  final TaskModel model;

  const AddTaskSuccess({required this.model});
}

final class AddTaskFailure extends TaskState {
  final String errorMessage;

  const AddTaskFailure({required this.errorMessage});
}

final class UploadingPhotoLoading extends TaskState {}

final class UploadingPhotoSuccess extends TaskState {}

final class UploadingPhotoFailure extends TaskState {
  final String errorMessage;

  const UploadingPhotoFailure({required this.errorMessage});
}
