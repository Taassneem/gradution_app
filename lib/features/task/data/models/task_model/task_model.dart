import 'package:equatable/equatable.dart';
import 'package:gradution_app/features/task/data/models/add_task_model/image.dart';

class TaskModel extends Equatable {
  final Image? image;
  final String? title;
  final List<dynamic>? days;
  final String? reminder;
  final String? repeater;
  final String? time;
  final DateTime? date;
  final String? selectedActivity;
  final String id;
  const TaskModel(
      {required this.image,
      required this.id,
      required this.title,
      required this.days,
      required this.reminder,
      required this.repeater,
      required this.time,
      required this.date,
      required this.selectedActivity});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      title: json['title'],
      days: json['daysOfWeek'],
      reminder: json['reminder'],
      repeater: json['repeater'],
      time: json['time'],
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      selectedActivity: json['selectedActivity'],
      id: json['_id']);

  @override
  List<Object?> get props => throw UnimplementedError();
}
