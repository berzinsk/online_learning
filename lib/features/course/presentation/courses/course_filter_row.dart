import 'package:flutter/material.dart';

import 'course_filter_row_item.dart';

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
