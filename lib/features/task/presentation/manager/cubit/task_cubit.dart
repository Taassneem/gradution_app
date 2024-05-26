import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/models/add_task_model/add_task_model.dart';
import 'package:gradution_app/features/task/data/models/delete_task_model.dart';
import 'package:gradution_app/features/task/data/models/edit_task_model/edit_task_model.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:gradution_app/features/task/data/repo/task_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timezone/timezone.dart' as tz;
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepo) : super(TaskInitial());
  final TaskRepo taskRepo;
  GlobalKey<FormState> taskKey = GlobalKey();
  GlobalKey<FormState> editTaskKey = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController editTitle = TextEditingController();
  String? image;
  String? categoryTitle;
  String? categoryImage;
  List<dynamic>? days;
  String? reminder;
  String? repeater;
  DateTime? date;
  tz.TZDateTime? time;
  String? editImage;
  String? editCategoryTitle;
  String? editCategoryImage;
  List<dynamic>? editDays;
  String? editReminder;
  String? editRepeater;
  DateTime? editDate;
  DateTime? editTime;
  XFile? taskImageFromGallery;
  GlobalCubit? global;
  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    var result = await taskRepo.fetchCategories();
    result.fold(
        (failure) =>
            emit(CategoriesFailure(errorMessage: failure.failure.errorMessage)),
        (category) => emit(CategoriesSuccess(categoryModel: category)));
  }

  Future<void> addTask() async {
    emit(AddTaskLoading());
    var result = await taskRepo.addTask(
        categoryTitle: categoryTitle,
        days: days ?? [''],
        reminder: reminder ?? '',
        repeater: repeater ?? '',
        categoryImage: categoryImage ?? '',
        title: title.text,
        date: today,
        time: time?.toLocal() ?? DateTime.now());
    result.fold(
        (failure) =>
            emit(AddTaskFailure(errorMessage: failure.failure.errorMessage)),
        (addTask) => emit(AddTaskSuccess(model: addTask)));
  }

  Future<void> fetchTasks() async {
    emit(FetchTasksLoading());
    var result = await taskRepo.fetchTasks();
    result.fold(
        (failure) =>
            emit(FetchTasksFailure(errorMessage: failure.failure.errorMessage)),
        (tasks) {
      emit(FetchTasksSuccess(tasks: tasks));
    });
  }

  List<TaskModel>? taskList;
  List<TaskModel> filterTasksList = [];
  Future<void> filterTasks() async {
    filterTasksList.clear();
    for (var i = 0; i < taskList!.length; i++) {
      if (taskList![i].date == today) {
        filterTasksList.add(taskList![i]);
      }
    }
  }

  Future<void> editTask({required String id}) async {
    emit(EditTaskLoading());
    var result = await taskRepo.editTask(
        days: editDays ?? [''],
        time: editTime?.toLocal() ?? DateTime.parse(global!.taskModel!.time!),
        reminder: editReminder ?? global!.taskModel!.reminder!,
        repeater: editRepeater ?? global!.taskModel!.repeater!,
        title: editTitle.text,
        id: id);
    result.fold(
        (failure) =>
            emit(EditTaskFailure(errorMessage: failure.failure.errorMessage)),
        (edit) {
      emit(EditTaskSuccess(editTaskModel: edit));
    });
  }

  Future<void> deleteTask({required String id}) async {
    emit(DeleteTaskLoading());
    var result = await taskRepo.deleteTask(id: id);
    result.fold(
        (failure) =>
            emit(DeleteTaskFailure(errorMessage: failure.failure.errorMessage)),
        (delete) => emit(DeleteTaskSuccess(deleteTaskModel: delete)));
  }

  DateTime today = DateTime.now();

  void selectedDay(selectedDay, focusedDay) {
    today = selectedDay;
    emit(TaskDaySelected(today));
  }

  void setTime(tz.TZDateTime newTime) {
    time = newTime;
    editTime = newTime;
    if (kDebugMode) {
      print("Converted Time: $time");
      print("Converted Time: $editTime");
    }
    emit(TaskTimeUpdated(newTime));
  }

  pickImageWithGallery() async {
    try {
      emit(UploadingPhotoLoading());

      final retunedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (retunedImage == null) return;

      taskImageFromGallery = XFile(retunedImage.path);

      emit(UploadingPhotoSuccess());
    } catch (e) {
      emit(UploadingPhotoFailure(errorMessage: e.toString()));
    }
  }
}
