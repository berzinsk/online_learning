import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';
import '../../model/course.dart';

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
          Flexible(
            child: Column(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
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
            ),
          )
        ],
      ),
    );
  }
}
