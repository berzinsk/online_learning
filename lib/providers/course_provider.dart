import 'package:flutter/material.dart';

import '../model/course.dart';
import '../resources/data/demo_courses.dart';

class CourseProvider extends ChangeNotifier {
  final _courses = demoCourses;
  int _selectedIndex = -1;

  List<Course> get courses => List.unmodifiable(_courses);
  int get selectedIndex => _selectedIndex;
  Course? get getSelectedCourse =>
      _selectedIndex != -1 ? _courses[_selectedIndex] : null;

  void courseTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
