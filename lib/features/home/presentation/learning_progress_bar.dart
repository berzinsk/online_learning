import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';

class LearningProgressBar extends StatelessWidget {
  final double progress;
  final double width;

  const LearningProgressBar({
    Key? key,
    required this.progress,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.kSecondaryGray,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Container(
          height: 6,
          width: width * progress,
          decoration: BoxDecoration(
            borderRadius: progress >= 1.0 ? BorderRadius.circular(16) : null,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white.withOpacity(0),
                AppColors.kProgressOrange,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
