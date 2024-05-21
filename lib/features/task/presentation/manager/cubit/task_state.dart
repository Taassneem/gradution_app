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
  final AddTaskModel model;

  const AddTaskSuccess({required this.model});
}

final class AddTaskFailure extends TaskState {
  final String errorMessage;

  const AddTaskFailure({required this.errorMessage});
}

final class TaskDaySelected extends TaskState {
  final DateTime today;

  const TaskDaySelected(this.today);
}

final class UploadingPhotoLoading extends TaskState {}

final class UploadingPhotoSuccess extends TaskState {}

final class UploadingPhotoFailure extends TaskState {
  final String errorMessage;

  const UploadingPhotoFailure({required this.errorMessage});
}

final class FetchTasksLoading extends TaskState {}

final class FetchTasksSuccess extends TaskState {
  final List<TaskModel> tasks;

  const FetchTasksSuccess({required this.tasks});
}

final class FetchTasksFailure extends TaskState {
  final String errorMessage;

  const FetchTasksFailure({required this.errorMessage});
}

final class EditTaskLoading extends TaskState {}

final class EditTaskSuccess extends TaskState {
  final EditTaskModel editTaskModel;

  const EditTaskSuccess({required this.editTaskModel});
}

final class EditTaskFailure extends TaskState {
  final String errorMessage;

  const EditTaskFailure({required this.errorMessage});
}

final class DeleteTaskLoading extends TaskState {}

final class DeleteTaskSuccess extends TaskState {
  final DeleteTaskModel deleteTaskModel;

  const DeleteTaskSuccess({required this.deleteTaskModel});
}

final class DeleteTaskFailure extends TaskState {
  final String errorMessage;

  const DeleteTaskFailure({required this.errorMessage});
}
