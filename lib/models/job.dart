import 'dart:convert';
import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final String title;
  final String type;
  final String level;
  final String? location;
  final bool isActive;

  const Job(
      {this.location,
      required this.title,
      required this.type,
      required this.level,
      required this.isActive});

  @override
  String toString() {
    return 'Job(title: $title, type: $type, level: $level, location: $location, isActive: $isActive)';
  }

  //Json Mapping and conversion
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      "type": type,
      "level": level,
      "location": location,
      "is_active": isActive
    };
  }

  factory Job.fromMap(Map<String, dynamic> myMap) {
    return Job(
        title: myMap['title'] ?? "",
        type: myMap['type'],
        level: myMap['level'] ?? "",
        location: myMap['location'] ?? "Remoto",
        isActive: myMap['is_active'] == "true");
  }

  String toJson() => json.encode(toMap());
  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));

  @override
  List<Object?> get props => [title, type, level, location, isActive];
}
