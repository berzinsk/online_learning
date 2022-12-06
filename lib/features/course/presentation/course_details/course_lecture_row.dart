import 'package:flutter/material.dart';
import 'package:online_learning/resources/constants/colors.dart';

import '../../domain/lecture.dart';

class CourseLectureRow extends StatelessWidget {
  final int index;
  final Lecture lecture;

  const CourseLectureRow({
    super.key,
    required this.index,
    required this.lecture,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.081),
            child: Text(
              '0$index',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.kShadow,
                    fontSize: 24,
                  ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lecture.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.kDarkBlue),
                ),
                Row(
                  children: [
                    Text(
                      _getLectureLength(lecture.duration),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: lecture.isPlayed
                                ? AppColors.kPrimaryBlue
                                : AppColors.kShadow,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Text(
                        'mins',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: lecture.isPlayed
                                  ? AppColors.kPrimaryBlue
                                  : AppColors.kShadow,
                            ),
                      ),
                    ),
                    if (lecture.isPlayed) ...[
                      const Image(
                        image: AssetImage('asset/images/icon_done.png'),
                      )
                    ]
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(_getPlayButtonIcon(lecture.isLocked)),
            ),
          ),
        ],
      ),
    );
  }

  String _getPlayButtonIcon(bool isLectureLocked) {
    if (isLectureLocked) {
      return 'asset/images/lecture_play_locked.png';
    }

    return 'asset/images/lecture_play.png';
  }

  String _getLectureLength(double minutes) {
    var d = Duration(minutes: minutes.toInt());
    List<String> parts = d.toString().split(':');

    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }
}
