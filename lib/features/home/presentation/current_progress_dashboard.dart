import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';
import 'learning_progress_bar.dart';

class CurrentProgressDashboard extends StatelessWidget {
  final void Function() onMyCoursesPress;

  const CurrentProgressDashboard({
    Key? key,
    required this.onMyCoursesPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: AppColors.kShadow.withOpacity(0.2),
            offset: const Offset(0, 12),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Learned today',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.kPrimaryTextGray),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: onMyCoursesPress,
                child: Text(
                  'My courses',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.kPrimaryBlue),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Text(
                  '46min',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.kDarkBlue),
                ),
                Text(
                  ' / 60min',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppColors.kPrimaryTextGray),
                ),
              ],
            ),
          ),
          LearningProgressBar(
            progress: 0.65,
            width: MediaQuery.of(context).size.width - 72,
          )
        ],
      ),
    );
  }
}
