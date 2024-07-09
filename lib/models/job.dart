import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Job extends Equatable {
  final int? id;
  final String title;
  final String type;
  final String level;
  final String? location;
  final bool is_active;

  const Job(
      {this.id,
      this.location,
      required this.title,
      required this.type,
      required this.level,
      required this.is_active});

  const Job.empty()
      : id = -1,
        location = null,
        title = "",
        type = "",
        level = "",
        is_active = false;

  @override
  String toString() {
    return 'Job(title: $title, type: $type, level: $level, location: $location, is_active: $is_active)';
  }

  //Json Mapping and conversion
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "type": type,
      "level": level,
      "location": location,
      "is_active": is_active ? 1 : 0
    };
  }

  factory Job.fromMap(Map<String, dynamic> myMap) {
    return Job(
        title: myMap['title'] ?? "",
        type: myMap['type'],
        level: myMap['level'] ?? "",
        location: myMap['location'] ?? "Remoto",
        is_active: myMap['is_active'] == true);
  }

  String toJson() => json.encode(toMap());
  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));

  @override
  List<Object?> get props => [title, type, level, location, is_active];
}
