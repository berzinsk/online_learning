import 'package:flutter/material.dart';
import 'package:online_learning/resources/constants/colors.dart';

import '../model/course.dart';
import '../resources/data/demo_courses.dart';

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
            CourseFilterRow(
              selectedFilterIndex: _selectedFilterIndex,
              onFilterSelected: onFilterSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class CourseFilterRow extends StatelessWidget {
  final int selectedFilterIndex;
  final void Function(int index) onFilterSelected;

  const CourseFilterRow({
    Key? key,
    required this.selectedFilterIndex,
    required this.onFilterSelected,
  }) : super(key: key);

  void onCourseFilterItemPress(int index) {
    onFilterSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CourseFilterRowItem(
          buttonIndex: 0,
          title: 'All',
          onButtonPress: onCourseFilterItemPress,
          isSelected: selectedFilterIndex == 0,
        ),
        CourseFilterRowItem(
          title: 'Popular',
          onButtonPress: onCourseFilterItemPress,
          buttonIndex: 1,
          isSelected: selectedFilterIndex == 1,
        ),
        CourseFilterRowItem(
          title: 'New',
          onButtonPress: onCourseFilterItemPress,
          buttonIndex: 2,
          isSelected: selectedFilterIndex == 2,
        ),
        const SizedBox(width: 40),
      ],
    );
  }
}

class CourseFilterRowItem extends StatelessWidget {
  final bool isSelected;
  final int buttonIndex;
  final String title;
  final void Function(int index) onButtonPress;

  const CourseFilterRowItem({
    Key? key,
    required this.buttonIndex,
    required this.title,
    required this.onButtonPress,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor:
              isSelected ? AppColors.kPrimaryBlue : Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          side: const BorderSide(color: Colors.transparent),
        ),
        onPressed: () {
          onButtonPress(buttonIndex);
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isSelected ? Colors.white : AppColors.kPrimaryTextGray),
        ),
      ),
    );
  }
}
