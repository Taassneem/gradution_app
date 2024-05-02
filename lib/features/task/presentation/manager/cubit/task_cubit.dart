import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/features/task/data/models/category_model/category_model.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';
import 'package:gradution_app/features/task/data/repo/task_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepo) : super(TaskInitial());
  final TaskRepo taskRepo;
  GlobalKey<FormState> taskKey = GlobalKey();
  TextEditingController title = TextEditingController();
  String? image;
  String? categoryTitle;
  String? categoryImage;
  List<String>? days;
  String? reminder;
  String? repeater;
  DateTime? date;
  XFile? taskImageFromCamera;
  DateTime? time;

  Future<void> fetchCategories() async {
    var result = await taskRepo.fetchCategories();
    result.fold(
        (failure) =>
            emit(CategoriesFailure(errorMessage: failure.errorMessage)),
        (category) => emit(CategoriesSuccess(categoryModel: category)));
  }

  Future<void> addTask() async {
    var result = await taskRepo.addTask(
      categoryTitle: categoryTitle,
      days: days ?? [''],
      reminder: reminder ?? '',
      repeater: repeater ?? '',
      image: image ?? categoryImage,
      title: title.text,
      date: date ?? DateTime.now(),
      time: time ?? DateTime.now()
    );
    result.fold(
        (failure) => emit(AddTaskFailure(errorMessage: failure.errorMessage)),
        (addTask) => emit(AddTaskSuccess(model: addTask)));
  }

  DateTime today = DateTime.now();

  void selectedDay(selectedDay, focusedDay) {
    today = selectedDay;
    emit(TaskDaySelected(today));
  }

  pickImageWithGallery() async {
    try {
      emit(UploadingPhotoLoading());

      final retunedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (retunedImage == null) return;

      taskImageFromCamera = XFile(retunedImage.path);

      emit(UploadingPhotoSuccess());
    } catch (e) {
      emit(UploadingPhotoFailure(errorMessage: e.toString()));
    }
  }
}
