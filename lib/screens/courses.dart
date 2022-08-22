import 'package:flutter/material.dart';
import 'package:online_learning/resources/constants/colors.dart';

import '../model/course.dart';
import '../resources/data/demo_courses.dart';
import '../components/course/course_filter_row.dart';

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

class CourseListItem extends StatelessWidget {
  final Course course;

  const CourseListItem({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 12),
            color: AppColors.kShadow.withOpacity(0.2),
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: course.imageUrl != null
                ? SizedBox(
                    width: 68,
                    height: 68,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(course.imageUrl ?? '',
                          fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.kDarkBlue,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset('asset/images/icon_author.png'),
                    ),
                    Text(
                      course.author,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.kShadow),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      '${course.price}€',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: AppColors.kPrimaryBlue),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.kLighOrange,
                    ),
                    child: Text(
                      '${course.durationInHours} hours',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.kButtonOrange,
                            fontSize: 10,
                          ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
