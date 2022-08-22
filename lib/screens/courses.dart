import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/course.dart';
import '../resources/data/demo_courses.dart';
import '../resources/constants/colors.dart';
import '../components/course/course_filter_row.dart';
import '../components/course/course_list_item.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);
  final List<Course> _allCourses = demoCourses;

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> _displayedCourses = [];
  int _selectedFilterIndex = 0;

  @override
  void initState() {
    _displayedCourses = widget._allCourses;

    super.initState();
  }

  void onFilterSelected(int index) {
    setState(() {
      switch (index) {
        case 0:
          _displayedCourses = widget._allCourses;
          break;
        case 1:
          _displayedCourses =
              widget._allCourses.where((e) => e.numberOfLikes > 500).toList();
          break;
        default:
          {
            List<Course> courses = List.from(widget._allCourses);
            courses.sort((a, b) {
              int dateA = DateFormat('dd-MM-yyyy')
                  .parse(a.dateCreated)
                  .millisecondsSinceEpoch;
              int dateB = DateFormat('dd-MM-yyyy')
                  .parse(b.dateCreated)
                  .millisecondsSinceEpoch;

              return dateB.compareTo(dateA);
            });

            _displayedCourses = courses;
          }

          break;
      }

      _selectedFilterIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Course',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('asset/images/profile_picture.jpeg'),
                  maxRadius: 25,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.kSecondaryGray,
                ),
                height: 48,
              ),
            ),
            Text(
              'Choose your course',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppColors.kDarkBlue),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: CourseFilterRow(
                selectedFilterIndex: _selectedFilterIndex,
                onFilterSelected: onFilterSelected,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 8),
                  itemBuilder: (context, index) {
                    Course course = _displayedCourses[index];
                    return CourseListItem(course: course);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemCount: _displayedCourses.length),
            ),
          ],
        ),
      ),
    );
  }
}
