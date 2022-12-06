import 'package:flutter/material.dart';

import '../../domain/course.dart';
import '../../../../resources/constants/colors.dart';
import 'course_lecture_list.dart';

class CourseData extends StatelessWidget {
  const CourseData({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course? course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  course?.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.kDarkBlue),
                ),
              ),
              Text(
                '${course?.price ?? ''}€',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.kPrimaryBlue),
              )
            ],
          ),
          Row(
            children: [
              Text(
                '${course?.durationInHours ?? ''}h',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.kPrimaryTextGray),
              ),
              Text(
                ' · ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.kPrimaryTextGray),
              ),
              Text(
                '24 Lessons',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.kPrimaryTextGray),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: Text(
              'About this course',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColors.kDarkBlue),
            ),
          ),
          Text(
            course?.description ?? '',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.kDescriptionGrey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 56, bottom: 110),
            child: SizedBox(
              height: 70.0 * course!.lectures.length,
              child: CourseLectureList(
                lectures: course!.lectures,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
