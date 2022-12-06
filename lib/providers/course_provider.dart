import 'package:flutter/material.dart';

import '../features/course/domain/course.dart';
import '../features/course/data/demo_courses.dart';

class CourseProvider extends ChangeNotifier {
  final _courses = demoCourses;
  List<Course> get courses => List.unmodifiable(_courses);

  Course? getCourse(int id) {
    final index = _courses.indexWhere((e) => e.id == id);
    if (index == -1) return null;

    return _courses[index];
  }

  int getCourseId(int index) {
    final course = _courses[index];
    return course.id;
  }
}
