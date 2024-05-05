import 'package:equatable/equatable.dart';

import 'image.dart';

class Added extends Equatable {
  final String? title;
  final List<dynamic>? daysOfWeek;
  final Image? image;
  final String? reminder;
  final String? time;
  final String? createdBy;
  final DateTime? date;
  final String? selectedActivity;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Added({
    this.title,
    this.daysOfWeek,
    this.image,
    this.reminder,
    this.time,
    this.createdBy,
    this.date,
    this.selectedActivity,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Added.fromJson(Map<String, dynamic> json) => Added(
        title: json['title'] as String?,
        daysOfWeek: json['daysOfWeek'] as List<dynamic>,
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
        reminder: json['reminder'] as String?,
        time: json['time'] as String?,
        createdBy: json['createdBy'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        selectedActivity: json['selectedActivity'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'daysOfWeek': daysOfWeek,
        'image': image?.toJson(),
        'reminder': reminder,
        'time': time,
        'createdBy': createdBy,
        'date': date?.toIso8601String(),
        'selectedActivity': selectedActivity,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      title,
      daysOfWeek,
      image,
      reminder,
      time,
      createdBy,
      date,
      selectedActivity,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
