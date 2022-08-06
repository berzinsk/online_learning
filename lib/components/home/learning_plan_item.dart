import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class LearningPlanItem extends StatelessWidget {
  final String name;
  final int currentLectureIndex;
  final int lectureCount;
  final bool isFirstItem;

  const LearningPlanItem({
    Key? key,
    required this.name,
    required this.currentLectureIndex,
    required this.lectureCount,
    this.isFirstItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              value: 0.3,
              backgroundColor: AppColors.kSecondaryGray,
              color: AppColors.kProgressGray,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.kDarkBlue),
          ),
          const Spacer(),
          Text(
            '$currentLectureIndex',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.kDarkBlue),
          ),
          Text(
            ' / $lectureCount',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.kShadow),
          ),
        ],
      ),
    );
  }
}
