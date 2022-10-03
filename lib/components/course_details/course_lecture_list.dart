import 'package:flutter/material.dart';

import 'course_lecture_row.dart';
import '../../model/lecture.dart';

class CourseLectureList extends StatelessWidget {
  final List<Lecture> lectures;

  const CourseLectureList({
    super.key,
    required this.lectures,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final lecture = lectures[index];

        return CourseLectureRow(
          index: index + 1,
          lecture: lecture,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: lectures.length,
    );
  }
}
