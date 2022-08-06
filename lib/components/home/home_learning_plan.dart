import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';
import './learning_plan_item.dart';

class HomeLearningPlan extends StatelessWidget {
  const HomeLearningPlan({Key? key}) : super(key: key);

  List<LearningPlanItem> getLearningPlan() {
    return const [
      LearningPlanItem(
        name: 'Packaging Design',
        currentLectureIndex: 40,
        lectureCount: 48,
      ),
      LearningPlanItem(
        name: 'Product Design',
        currentLectureIndex: 6,
        lectureCount: 24,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Learning Plan',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: AppColors.kDarkBlue),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: AppColors.kShadow.withOpacity(0.2),
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: getLearningPlan(),
          ),
        )
      ],
    );
  }
}
