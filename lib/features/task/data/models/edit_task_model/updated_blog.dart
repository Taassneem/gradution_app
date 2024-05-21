import 'package:equatable/equatable.dart';

import 'image.dart';

class UpdatedBlog extends Equatable {
  final Image? image;
  final String? id;
  final String? title;
  final List<String>? daysOfWeek;
  final String? reminder;
  final String? repeater;
  final String? time;
  final String? createdBy;
  final DateTime? date;
  final String? selectedActivity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const UpdatedBlog({
    this.image,
    this.id,
    this.title,
    this.daysOfWeek,
    this.reminder,
    this.repeater,
    this.time,
    this.createdBy,
    this.date,
    this.selectedActivity,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UpdatedBlog.fromJson(Map<String, dynamic> json) => UpdatedBlog(
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        title: json['title'] as String?,
        daysOfWeek: json['daysOfWeek'] as List<String>?,
        reminder: json['reminder'] as String?,
        repeater: json['repeater'] as String?,
        time: json['time'] as String?,
        createdBy: json['createdBy'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        selectedActivity: json['selectedActivity'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'image': image?.toJson(),
        '_id': id,
        'title': title,
        'daysOfWeek': daysOfWeek,
        'reminder': reminder,
        'repeater': repeater,
        'time': time,
        'createdBy': createdBy,
        'date': date?.toIso8601String(),
        'selectedActivity': selectedActivity,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      image,
      id,
      title,
      daysOfWeek,
      reminder,
      repeater,
      time,
      createdBy,
      date,
      selectedActivity,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
