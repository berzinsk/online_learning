import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class HomeMeetup extends StatelessWidget {
  const HomeMeetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.kLightPink,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Meetup',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: AppColors.kPurple),
                  ),
                ),
                Text(
                  'Off-line exchanges of learning experiences',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.kPurple),
                ),
              ],
            ),
          ),
          const Image(
            width: 96,
            height: 96,
            image: AssetImage('asset/images/icon_meetup.png'),
          ),
        ],
      ),
    );
  }
}
