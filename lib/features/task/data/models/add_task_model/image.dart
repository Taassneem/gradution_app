import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? id;
  final String? url;

  const Image({this.id, this.url});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };

  @override
  List<Object?> get props => [id, url];
}
