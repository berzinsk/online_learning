import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';
import './current_progress_dashboard.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 66),
              color: AppColors.kPrimaryBlue,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                bottom: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Karlis',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          'Let\'s start learning',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('asset/images/profile_picture.jpeg'),
                      maxRadius: 25,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 66,
              color: Colors.white,
            )
          ],
        ),
        Positioned(
          bottom: 16,
          left: 20,
          right: 20,
          child: CurrentProgressDashboard(
            onMyCoursesPress: () {},
          ),
        )
      ],
    );
  }
}
